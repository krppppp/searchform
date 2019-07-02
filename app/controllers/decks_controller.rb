class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  # GET /decks
  # GET /decks.json
  def index
    @decks_all = Deck.all
    @decks = Kaminari.paginate_array(@decks_all).page(params[:page]).per(5)
  end

  # GET /decks/1
  # GET /decks/1.json
  def show
  end

  # GET /decks/new
  def new
    @deck = Deck.new
  end

  # GET /decks/1/edit
  def edit
  end

  # POST /decks
  # POST /decks.json
  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user

    respond_to do |format|
      if @deck.save!
        params.permit![:deck][:main].keys.each do |key|
          deck_card = params.permit![:deck][:main][key]
          DeckCard.create!(card_id: deck_card['id'], deck: @deck, deck_type: Card.find(deck_card['id']).num_categolized?, count: deck_card['count'])
        end

        params.permit![:deck][:side].keys.each do |key|
          deck_card = params.permit![:deck][:side][key]
          DeckCard.create!(card_id: deck_card['id'], deck: @deck, deck_type: Card.find(deck_card['id']).num_categolized?, count: deck_card['count'])
        end

        # format.html { redirect_to @deck, notice: 'Deck was successfully created.' }
        format.json { render json: {status: 200, deck_id: @deck.id} }
      else
        format.json { render json: {status: 400, deck_id: nil} }
      end
    end
  end

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck.destroy
    respond_to do |format|
      if Rails.application.routes.recognize_path(request.referrer)[:controller] == 'users'
        format.html { redirect_to user_path(current_user), notice: 'Deck was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to decks_url, notice: 'Deck was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow he white list through.
    def deck_params
      params
          .require(:deck)
          .permit(:name, :category_id, :main, :side)
    end

end

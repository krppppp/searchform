class DeckCardsController < ApplicationController
  before_action :set_deck_card, only: [:show, :edit, :update, :destroy]

  # GET /deck_cards
  # GET /deck_cards.json
  def index
    @deck_cards = DeckCard.all
  end

  # GET /deck_cards/1
  # GET /deck_cards/1.json
  def show
  end

  # GET /deck_cards/new
  def new
    @deck_card = DeckCard.new
  end

  # GET /deck_cards/1/edit
  def edit
  end

  # POST /deck_cards
  # POST /deck_cards.json
  def create
    @deck_card = DeckCard.new(deck_card_params)

    respond_to do |format|
      if @deck_card.save
        format.html { redirect_to @deck_card, notice: 'Deck card was successfully created.' }
        format.json { render :show, status: :created, location: @deck_card }
      else
        format.html { render :new }
        format.json { render json: @deck_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deck_cards/1
  # PATCH/PUT /deck_cards/1.json
  def update
    respond_to do |format|
      if @deck_card.update(deck_card_params)
        format.html { redirect_to @deck_card, notice: 'Deck card was successfully updated.' }
        format.json { render :show, status: :ok, location: @deck_card }
      else
        format.html { render :edit }
        format.json { render json: @deck_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deck_cards/1
  # DELETE /deck_cards/1.json
  def destroy
    @deck_card.destroy
    respond_to do |format|
      format.html { redirect_to deck_cards_url, notice: 'Deck card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck_card
      @deck_card = DeckCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_card_params
      params.fetch(:deck_card, {})
    end
end

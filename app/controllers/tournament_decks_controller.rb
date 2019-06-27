class TournamentDecksController < ApplicationController
  before_action :set_tournament_deck, only: [:show, :edit, :update, :destroy]

  # GET /tournament_decks
  # GET /tournament_decks.json
  def index
    @tournament_decks = TournamentDeck.all
  end

  # GET /tournament_decks/1
  # GET /tournament_decks/1.json
  def show
  end

  # GET /tournament_decks/new
  def new
    @tournament_deck = TournamentDeck.new
  end

  # GET /tournament_decks/1/edit
  def edit
  end

  # POST /tournament_decks
  # POST /tournament_decks.json
  def create
    @tournament_deck = TournamentDeck.new(tournament_deck_params)

    respond_to do |format|
      if @tournament_deck.save
        format.html { redirect_to @tournament_deck, notice: 'Tournament deck was successfully created.' }
        format.json { render :show, status: :created, location: @tournament_deck }
      else
        format.html { render :new }
        format.json { render json: @tournament_deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament_decks/1
  # PATCH/PUT /tournament_decks/1.json
  def update
    respond_to do |format|
      if @tournament_deck.update(tournament_deck_params)
        format.html { redirect_to @tournament_deck, notice: 'Tournament deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament_deck }
      else
        format.html { render :edit }
        format.json { render json: @tournament_deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_decks/1
  # DELETE /tournament_decks/1.json
  def destroy
    @tournament_deck.destroy
    respond_to do |format|
      format.html { redirect_to tournament_decks_url, notice: 'Tournament deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_deck
      @tournament_deck = TournamentDeck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_deck_params
      params.fetch(:tournament_deck, {})
    end
end

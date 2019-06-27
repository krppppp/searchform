class RecordCardsController < ApplicationController
  before_action :set_series_card, only: [:show, :edit, :update, :destroy]

  # GET /recordCards
  # GET /recordCards.json
  def index
    @record_cards = RecordCard.all
  end

  # GET /recordCards/1
  # GET /recordCards/1.json
  def show
  end

  # GET /recordCards/new
  def new
    @record_card = RecordCard.new
  end

  # GET /recordCards/1/edit
  def edit
  end

  # POST /recordCards
  # POST /recordCards.json
  def create
    @record_card = RecordCard.new(series_card_params)

    respond_to do |format|
      if @record_card.save
        format.html { redirect_to @record_card, notice: 'Series card was successfully created.' }
        format.json { render :show, status: :created, location: @record_card }
      else
        format.html { render :new }
        format.json { render json: @record_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recordCards/1
  # PATCH/PUT /recordCards/1.json
  def update
    respond_to do |format|
      if @record_card.update(series_card_params)
        format.html { redirect_to @record_card, notice: 'Series card was successfully updated.' }
        format.json { render :show, status: :ok, location: @record_card }
      else
        format.html { render :edit }
        format.json { render json: @record_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recordCards/1
  # DELETE /recordCards/1.json
  def destroy
    @record_card.destroy
    respond_to do |format|
      format.html { redirect_to recordCards_url, notice: 'Series card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series_card
      @record_card = RecordCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_card_params
      params.fetch(:record_card, {})
    end
end

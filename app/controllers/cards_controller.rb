class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy], except: [:search]

  def ajax_card
    @cards_search_form = CardsSearchForm.new(ajax_params)
    @cards = @cards_search_form.search_deck_cards(ajax_params)

    render json: {status: 200, data: @cards.blank? ? [] : (params[:type] == 'full' ? @cards : @cards.first(100)).map{|s| {id: s.id, name: s.name, attribute_id: s.attribute_id, type: s.num_categolized?, effect: (s.magic? || s.trap?) ? s.effect.to_s.gsub('効果', '').gsub(/\r\n|\r|\n/, "").gsub(/罠|魔法/, '') : '', level: s.level_rank_link }}}
  end

  # GET /cards
  # GET /cards.json
  def index
    @cards_search_form = CardsSearchForm.new
  end

  def search
    @cards_search_form = CardsSearchForm.new(search_params)
    @cards_all = @cards_search_form.search_card(search_params)
    @cards = Kaminari.paginate_array(@cards_all).page(params[:page]).per(100)
    @attribute_images = [
        'attribute_icon_dark.png',
        'attribute_icon_light.png',
        'attribute_icon_earth.png',
        'attribute_icon_water.png',
        'attribute_icon_fire.png',
        'attribute_icon_wind.png',
        'attribute_icon_divine.png'
    ]
    @effect_images = [
        '' => '',
    ]
    render 'result'
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(create_params)
    @card.attribute_id = 1
    @card.tribe_id = 1

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.fetch(:card, {})
    end

    def create_params
      params
          .require(:card)
          .permit(:image)
    end

    def search_params
      params
          .require(:cards_search_form)
          .permit(:effect_category, :keyword, :name, :name_kana, :text, :card_monster1, :card_monster2, :tribe, :attribute, :level_low, :level_high, :level, :rank, :pendulum_blue_low, :pendulum_blue_high, :pendulum_red_low, :pendulum_red_high, :link_low, :link_high, :left_up, :up, :right_up, :left, :right, :left_down, :down, :right_down, :offensive_power_low, :offensive_power_high, :offensive_power_nil, :deffensive_power_low, :deffensive_power_high, :deffensive_power_nil, :no_restriction, :semi_restriction, :restriction, :ban)
    end

    def ajax_params
      params
          .require(:cards_search_form)
          .permit(:deck_keyword, :deck_category, :deck_type, :deck_attribute, :deck_level, :deck_tribe, :deck_restriction)
    end
end

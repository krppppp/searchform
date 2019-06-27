require 'test_helper'

class DeckCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deck_card = deck_cards(:one)
  end

  test "should get index" do
    get deck_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_deck_card_url
    assert_response :success
  end

  test "should create deck_card" do
    assert_difference('DeckCard.count') do
      post deck_cards_url, params: { deck_card: {  } }
    end

    assert_redirected_to deck_card_url(DeckCard.last)
  end

  test "should show deck_card" do
    get deck_card_url(@deck_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_deck_card_url(@deck_card)
    assert_response :success
  end

  test "should update deck_card" do
    patch deck_card_url(@deck_card), params: { deck_card: {  } }
    assert_redirected_to deck_card_url(@deck_card)
  end

  test "should destroy deck_card" do
    assert_difference('DeckCard.count', -1) do
      delete deck_card_url(@deck_card)
    end

    assert_redirected_to deck_cards_url
  end
end

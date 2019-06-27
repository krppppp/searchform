require 'test_helper'

class TournamentDecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament_deck = tournament_decks(:one)
  end

  test "should get index" do
    get tournament_decks_url
    assert_response :success
  end

  test "should get new" do
    get new_tournament_deck_url
    assert_response :success
  end

  test "should create tournament_deck" do
    assert_difference('TournamentDeck.count') do
      post tournament_decks_url, params: { tournament_deck: {  } }
    end

    assert_redirected_to tournament_deck_url(TournamentDeck.last)
  end

  test "should show tournament_deck" do
    get tournament_deck_url(@tournament_deck)
    assert_response :success
  end

  test "should get edit" do
    get edit_tournament_deck_url(@tournament_deck)
    assert_response :success
  end

  test "should update tournament_deck" do
    patch tournament_deck_url(@tournament_deck), params: { tournament_deck: {  } }
    assert_redirected_to tournament_deck_url(@tournament_deck)
  end

  test "should destroy tournament_deck" do
    assert_difference('TournamentDeck.count', -1) do
      delete tournament_deck_url(@tournament_deck)
    end

    assert_redirected_to tournament_decks_url
  end
end

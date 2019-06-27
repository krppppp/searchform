require "application_system_test_case"

class DeckCardsTest < ApplicationSystemTestCase
  setup do
    @deck_card = deck_cards(:one)
  end

  test "visiting the index" do
    visit deck_cards_url
    assert_selector "h1", text: "Deck Cards"
  end

  test "creating a Deck card" do
    visit deck_cards_url
    click_on "New Deck Card"

    click_on "Create Deck card"

    assert_text "Deck card was successfully created"
    click_on "Back"
  end

  test "updating a Deck card" do
    visit deck_cards_url
    click_on "Edit", match: :first

    click_on "Update Deck card"

    assert_text "Deck card was successfully updated"
    click_on "Back"
  end

  test "destroying a Deck card" do
    visit deck_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Deck card was successfully destroyed"
  end
end

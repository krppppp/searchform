require "application_system_test_case"

class TournamentDecksTest < ApplicationSystemTestCase
  setup do
    @tournament_deck = tournament_decks(:one)
  end

  test "visiting the index" do
    visit tournament_decks_url
    assert_selector "h1", text: "Tournament Decks"
  end

  test "creating a Tournament deck" do
    visit tournament_decks_url
    click_on "New Tournament Deck"

    click_on "Create Tournament deck"

    assert_text "Tournament deck was successfully created"
    click_on "Back"
  end

  test "updating a Tournament deck" do
    visit tournament_decks_url
    click_on "Edit", match: :first

    click_on "Update Tournament deck"

    assert_text "Tournament deck was successfully updated"
    click_on "Back"
  end

  test "destroying a Tournament deck" do
    visit tournament_decks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tournament deck was successfully destroyed"
  end
end

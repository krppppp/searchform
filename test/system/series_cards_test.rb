require "application_system_test_case"

class SeriesCardsTest < ApplicationSystemTestCase
  setup do
    @record_card = series_cards(:one)
  end

  test "visiting the index" do
    visit recordCards_url
    assert_selector "h1", text: "Series Cards"
  end

  test "creating a Series card" do
    visit recordCards_url
    click_on "New Series Card"

    click_on "Create Series card"

    assert_text "Series card was successfully created"
    click_on "Back"
  end

  test "updating a Series card" do
    visit recordCards_url
    click_on "Edit", match: :first

    click_on "Update Series card"

    assert_text "Series card was successfully updated"
    click_on "Back"
  end

  test "destroying a Series card" do
    visit recordCards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Series card was successfully destroyed"
  end
end

require "application_system_test_case"

class TribesTest < ApplicationSystemTestCase
  setup do
    @tribe = tribes(:one)
  end

  test "visiting the index" do
    visit tribes_url
    assert_selector "h1", text: "Tribes"
  end

  test "creating a Tribe" do
    visit tribes_url
    click_on "New Tribe"

    click_on "Create Tribe"

    assert_text "Tribe was successfully created"
    click_on "Back"
  end

  test "updating a Tribe" do
    visit tribes_url
    click_on "Edit", match: :first

    click_on "Update Tribe"

    assert_text "Tribe was successfully updated"
    click_on "Back"
  end

  test "destroying a Tribe" do
    visit tribes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tribe was successfully destroyed"
  end
end

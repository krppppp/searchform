require 'test_helper'

class SeriesCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record_card = series_cards(:one)
  end

  test "should get index" do
    get recordCards_url
    assert_response :success
  end

  test "should get new" do
    get new_recordCard_url
    assert_response :success
  end

  test "should create record_card" do
    assert_difference('RecordCard.count') do
      post recordCards_url, params: {record_card: {  } }
    end

    assert_redirected_to recordCard_url(RecordCard.last)
  end

  test "should show record_card" do
    get recordCard_url(@record_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_recordCard_url(@record_card)
    assert_response :success
  end

  test "should update record_card" do
    patch recordCard_url(@record_card), params: {record_card: {  } }
    assert_redirected_to recordCard_url(@record_card)
  end

  test "should destroy record_card" do
    assert_difference('RecordCard.count', -1) do
      delete recordCard_url(@record_card)
    end

    assert_redirected_to recordCards_url
  end
end

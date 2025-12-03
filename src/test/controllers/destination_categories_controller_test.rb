require "test_helper"

class DestinationCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @destination_category = destination_categories(:one)
  end

  test "should get index" do
    get destination_categories_url, as: :json
    assert_response :success
  end

  test "should create destination_category" do
    assert_difference("DestinationCategory.count") do
      post destination_categories_url, params: { destination_category: { category_id: @destination_category.category_id, destination_id: @destination_category.destination_id } }, as: :json
    end

    assert_response :created
  end

  test "should show destination_category" do
    get destination_category_url(@destination_category), as: :json
    assert_response :success
  end

  test "should update destination_category" do
    patch destination_category_url(@destination_category), params: { destination_category: { category_id: @destination_category.category_id, destination_id: @destination_category.destination_id } }, as: :json
    assert_response :success
  end

  test "should destroy destination_category" do
    assert_difference("DestinationCategory.count", -1) do
      delete destination_category_url(@destination_category), as: :json
    end

    assert_response :no_content
  end
end

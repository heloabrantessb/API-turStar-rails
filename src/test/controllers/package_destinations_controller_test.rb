require "test_helper"

class PackageDestinationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @package_destination = package_destinations(:one)
  end

  test "should get index" do
    get package_destinations_url, as: :json
    assert_response :success
  end

  test "should create package_destination" do
    assert_difference("PackageDestination.count") do
      post package_destinations_url, params: { package_destination: { destination_id: @package_destination.destination_id, package_id: @package_destination.package_id } }, as: :json
    end

    assert_response :created
  end

  test "should show package_destination" do
    get package_destination_url(@package_destination), as: :json
    assert_response :success
  end

  test "should update package_destination" do
    patch package_destination_url(@package_destination), params: { package_destination: { destination_id: @package_destination.destination_id, package_id: @package_destination.package_id } }, as: :json
    assert_response :success
  end

  test "should destroy package_destination" do
    assert_difference("PackageDestination.count", -1) do
      delete package_destination_url(@package_destination), as: :json
    end

    assert_response :no_content
  end
end

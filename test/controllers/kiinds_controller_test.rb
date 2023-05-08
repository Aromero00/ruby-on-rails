require "test_helper"

class KiindsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kiind = kiinds(:one)
  end

  test "should get index" do
    get kiinds_url, as: :json
    assert_response :success
  end

  test "should create kiind" do
    assert_difference("Kiind.count") do
      post kiinds_url, params: { kiind: { description: @kiind.description } }, as: :json
    end

    assert_response :created
  end

  test "should show kiind" do
    get kiind_url(@kiind), as: :json
    assert_response :success
  end

  test "should update kiind" do
    patch kiind_url(@kiind), params: { kiind: { description: @kiind.description } }, as: :json
    assert_response :success
  end

  test "should destroy kiind" do
    assert_difference("Kiind.count", -1) do
      delete kiind_url(@kiind), as: :json
    end

    assert_response :no_content
  end
end

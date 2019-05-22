require 'test_helper'

class GameStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_status = game_statuses(:one)
  end

  test "should get index" do
    get game_statuses_url, as: :json
    assert_response :success
  end

  test "should create game_status" do
    assert_difference('GameStatus.count') do
      post game_statuses_url, params: { game_status: { description: @game_status.description } }, as: :json
    end

    assert_response 201
  end

  test "should show game_status" do
    get game_status_url(@game_status), as: :json
    assert_response :success
  end

  test "should update game_status" do
    patch game_status_url(@game_status), params: { game_status: { description: @game_status.description } }, as: :json
    assert_response 200
  end

  test "should destroy game_status" do
    assert_difference('GameStatus.count', -1) do
      delete game_status_url(@game_status), as: :json
    end

    assert_response 204
  end
end

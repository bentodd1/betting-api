require 'test_helper'

class UserBetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_bet = user_bets(:one)
  end

  test "should get index" do
    get user_bets_url, as: :json
    assert_response :success
  end

  test "should create user_bet" do
    assert_difference('UserBet.count') do
      post user_bets_url, params: { user_bet: { amount: @user_bet.amount, betting_scenario_id: @user_bet.betting_scenario_id, user_id: @user_bet.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_bet" do
    get user_bet_url(@user_bet), as: :json
    assert_response :success
  end

  test "should update user_bet" do
    patch user_bet_url(@user_bet), params: { user_bet: { amount: @user_bet.amount, betting_scenario_id: @user_bet.betting_scenario_id, user_id: @user_bet.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_bet" do
    assert_difference('UserBet.count', -1) do
      delete user_bet_url(@user_bet), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class BettingScenariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @betting_scenario = betting_scenarios(:one)
  end

  test "should get index" do
    get betting_scenarios_url, as: :json
    assert_response :success
  end

  test "should create betting_scenario" do
    assert_difference('BettingScenario.count') do
      post betting_scenarios_url, params: { betting_scenario: { description: @betting_scenario.description, game_id: @betting_scenario.game_id } }, as: :json
    end

    assert_response 201
  end

  test "should show betting_scenario" do
    get betting_scenario_url(@betting_scenario), as: :json
    assert_response :success
  end

  test "should update betting_scenario" do
    patch betting_scenario_url(@betting_scenario), params: { betting_scenario: { description: @betting_scenario.description, game_id: @betting_scenario.game_id } }, as: :json
    assert_response 200
  end

  test "should destroy betting_scenario" do
    assert_difference('BettingScenario.count', -1) do
      delete betting_scenario_url(@betting_scenario), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class UserAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_account = user_accounts(:one)
  end

  test "should get index" do
    get user_accounts_url, as: :json
    assert_response :success
  end

  test "should create user_account" do
    assert_difference('UserAccount.count') do
      post user_accounts_url, params: { user_account: { ammount_free: @user_account.ammount_free, ammount_in_play: @user_account.ammount_in_play, user_id: @user_account.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_account" do
    get user_account_url(@user_account), as: :json
    assert_response :success
  end

  test "should update user_account" do
    patch user_account_url(@user_account), params: { user_account: { ammount_free: @user_account.ammount_free, ammount_in_play: @user_account.ammount_in_play, user_id: @user_account.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_account" do
    assert_difference('UserAccount.count', -1) do
      delete user_account_url(@user_account), as: :json
    end

    assert_response 204
  end
end

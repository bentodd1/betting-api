class UserAccountsController < ApplicationController
  before_action :set_user_account, only: [:show, :update, :destroy]

  # GET /user_accounts
  def index
    @user_accounts = UserAccount.all

    render json: @user_accounts
  end

  # GET /user_accounts/1
  def show
    render json: @user_account
  end

  def self
    authToken = request.headers["Authorization"]
    puts authToken
    user = User.find_by(id: 1)
    user = User.find_by(auth_token: authToken)
    puts user
    #user = User.find_by(auth_token: params["auth_token"])
    user_account = UserAccount.find_by(user_id: user.id)
    render json: user_account
  end

  # POST /user_accounts
  def create
    @user_account = UserAccount.new(user_account_params)

    if @user_account.save
      render json: @user_account, status: :created, location: @user_account
    else
      render json: @user_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_accounts/1
  def update
    if @user_account.update(user_account_params)
      render json: @user_account
    else
      render json: @user_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_accounts/1
  def destroy
    @user_account.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_account
    @user_account = UserAccount.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_account_params
    params.require(:user_account).permit(:user_id, :ammount_free, :ammount_in_play)
  end
end

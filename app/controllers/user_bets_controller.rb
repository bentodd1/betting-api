class UserBetsController < ApplicationController
  before_action :set_user_bet, only: [:show, :update, :destroy]

  # GET /user_bets
  def index
    @user_bets = UserBet.all

    render json: @user_bets
  end

  # GET /user_bets/1
  def show
    render json: @user_bet
  end

  # POST /user_bets
  def create
    puts user_bet_params
    user = User.find_by(auth_token: params[:auth_token])
    #user = User.find_by(auth_token: params["auth_token"])
    user_account = UserAccount.find_by(user_id: user.id)
    amount = params[:amount].to_i
    puts "amount"
    puts amount
    my_params = {
      user_id: user.id,
      betting_scenario_id: params[:betting_scenario_id],
      amount: params[:amount],
    }
    user_account.ammount_free = user_account.ammount_free - amount
    user_account.ammount_in_play = user_account.ammount_in_play + amount
    user_account.save
    @user_bet = UserBet.new(my_params)
    puts user_account.ammount_free
    puts user_account.ammount_in_play
    if @user_bet.save
      render json: @user_bet, status: :created, location: @user_bet
    else
      render json: @user_bet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_bets/1
  def update
    if @user_bet.update(user_bet_params)
      render json: @user_bet
    else
      render json: @user_bet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_bets/1
  def destroy
    @user_bet.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_bet
    @user_bet = UserBet.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_bet_params
    params.require(:user_bet).permit(:user_id, :betting_scenario_id, :amount)
  end
end

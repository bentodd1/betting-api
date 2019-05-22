class GameStatusesController < ApplicationController
  before_action :set_game_status, only: [:show, :update, :destroy]

  # GET /game_statuses
  def index
    @game_statuses = GameStatus.all

    render json: @game_statuses
  end

  # GET /game_statuses/1
  def show
    render json: @game_status
  end

  # POST /game_statuses
  def create
    @game_status = GameStatus.new(game_status_params)

    if @game_status.save
      render json: @game_status, status: :created, location: @game_status
    else
      render json: @game_status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_statuses/1
  def update
    if @game_status.update(game_status_params)
      render json: @game_status
    else
      render json: @game_status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /game_statuses/1
  def destroy
    @game_status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_status
      @game_status = GameStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_status_params
      params.require(:game_status).permit(:description)
    end
end

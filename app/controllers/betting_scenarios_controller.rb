class BettingScenariosController < ApplicationController
  before_action :set_betting_scenario, only: [:show, :update, :destroy]

  # GET /betting_scenarios
  def index
    @betting_scenarios = BettingScenario.all

    render json: @betting_scenarios
  end

  # GET /betting_scenarios/1
  def show
    render json: @betting_scenario
  end

  # POST /betting_scenarios
  def create
    @betting_scenario = BettingScenario.new(betting_scenario_params)

    if @betting_scenario.save
      render json: @betting_scenario, status: :created, location: @betting_scenario
    else
      render json: @betting_scenario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /betting_scenarios/1
  def update
    if @betting_scenario.update(betting_scenario_params)
      render json: @betting_scenario
    else
      render json: @betting_scenario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /betting_scenarios/1
  def destroy
    @betting_scenario.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_betting_scenario
      @betting_scenario = BettingScenario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def betting_scenario_params
      params.require(:betting_scenario).permit(:description, :game_id)
    end
end

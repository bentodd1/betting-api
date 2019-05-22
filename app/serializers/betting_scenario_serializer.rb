class BettingScenarioSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :game
end

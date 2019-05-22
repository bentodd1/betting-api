class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :home_team, :visiting_team, :game_status, :game_time
end

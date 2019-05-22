class LeagueSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end

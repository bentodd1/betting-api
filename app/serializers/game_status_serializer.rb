class GameStatusSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description
end

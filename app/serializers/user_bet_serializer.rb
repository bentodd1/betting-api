class UserBetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :betting_scenario, :amount
end

class UserBet < ApplicationRecord
  belongs_to :user
  belongs_to :betting_scenario
end

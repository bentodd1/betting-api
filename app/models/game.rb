class Game < ApplicationRecord
  attr_accessor :description
  has_many :betting_scenarios
  scope :leagues_id, -> (leagues_id) { where leagues_id: leagues_id }
end

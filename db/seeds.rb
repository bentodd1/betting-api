require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

League.create({ name: "NBA" })
League.create({ name: "NFL" })
League.create({ name: "NHL" })
Game.create({ description: "Blai", visiting_team: "Broncos", home_team: "Chargers" })
100.times do
  Game.create({ visiting_team: Faker::Team.name, home_team: Faker::Team.name, game_time: Faker::Date.between(2.days.ago, Date.today), game_status: 0, description: Faker::Team.name, leagues_id: Faker::Number.between(1, 3) })
end
i = 0
100.times do
  i += 1
  BettingScenario.create({ value: Faker::Number.number(1), game_id: i, scenario_type: 1 })
  BettingScenario.create({ value: -(Faker::Number.number(1)), game_id: i, scenario_type: 2 })
  BettingScenario.create({ value: Faker::Number.number(2), game_id: i, scenario_type: 3 })
  BettingScenario.create({ value: Faker::Number.number(2), game_id: i, scenario_type: 4 })
end

i = 0
100.times do
  i += 1
  myPassword = Faker::Creature::Animal.name
  myEmail = Faker::Internet.email
  puts myEmail
  puts myPassword

  digest = User.digest("password")

  User.create({ username: Faker::Name.unique.name, email: myEmail, password: myPassword, first_name: Faker::Name.name, last_name: Faker::Name.name, status: 0, password_digest: digest })
end

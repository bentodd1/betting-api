require "faker"
require "net/http"
require "uri"
require "json"
require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

League.create({ name: "baseball_mlb" })
# League.create({ name: "NFL" })
=begin
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
=end
i = 0
1.times do
  i += 1
  myPassword = Faker::Creature::Animal.name
  myEmail = Faker::Internet.unique.email
  puts myEmail
  puts myPassword

  digest = User.digest("password")

  user = User.create({ username: Faker::Name.unique.name, email: myEmail, password: myPassword, first_name: Faker::Name.name, last_name: Faker::Name.name, status: 0, password_digest: digest })

  UserAccount.create({ user_id: user.id, ammount_free: Faker::Number.number(5), ammount_in_play: 0 })
end

# Headers key X-RapidAPI-Host value odds.p.rapidapi.com
#key X-RapidAPI-Key value bd90c1b664mshed16a790f8bcc0cp1c23a4jsn68c19c3c9c6e
#uri = URI.parse("https://odds.p.rapidapi.com/v1/sports")
uri = URI.parse("https://odds.p.rapidapi.com/v1/odds?sport=baseball_mlb&region=us&mkt=spreads")

request = Net::HTTP::Get.new(uri)
request.content_type = "application/json"
headers = {
  "X-RapidAPI-Host" => "odds.p.rapidapi.com",
  "X-RapidAPI-Key" => "bd90c1b664mshed16a790f8bcc0cp1c23a4jsn68c19c3c9c6e",
}

request["X-RapidAPI-Host"] = "odds.p.rapidapi.com"
request["X-RapidAPI-Key"] = "bd90c1b664mshed16a790f8bcc0cp1c23a4jsn68c19c3c9c6e"

req_options = {
  use_ssl: uri.scheme == "https",
}

@response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end
bodyArray = JSON.parse(@response.body)
#puts bodyArray
### Todo tomoroow error checking
bodyArray["data"].each do |i|
  teams = i["teams"]
  homeTeam = i["home_team"]
  commenceTime = i["commence_time"]

  index = teams.find_index(homeTeam)
  awayIndex = 0
  if (index == 1)
    awayIndex = 0
  elsif (index == 0)
    awayIndex = 1
  end
  awayTeam = teams[awayIndex]

  game_params = {
    home_team: homeTeam,
    visiting_team: awayTeam,
    game_status: 0,
    game_time: commenceTime,
    leagues_id: 1,
  }

  @game = Game.new(game_params)
  @game.save
  puts i["sites"].size
  if (!i["sites"].empty?)
    puts i
    puts "sites"
    puts i["sites"]
    valueHome = i["sites"][0]["odds"]["spreads"]["points"][0]
    #puts valueHome
    valueAway = i["sites"][0]["odds"]["spreads"]["points"][1]

    betting_scenario_1 =
      {
        description: homeTeam,
        game_id: @game.id,
        scenario_type: 1,
        value: valueHome,
      }

    betting_scenario_2 =
      {
        description: awayTeam,
        game_id: @game.id,
        scenario_type: 2,
        value: valueAway,
      }
    @bettingScenario = BettingScenario.new(betting_scenario_1)
    @bettingScenario.save
    @bettingScenario = BettingScenario.new(betting_scenario_2)
    @bettingScenario.save
  end
  puts @game.id

  #puts i["home_team"]
  puts " "
end

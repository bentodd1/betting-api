require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
i = 0
100.times do
  i += 1
  User.create({ username: Faker::Name.unique.name, email: Faker::Internet.email, password: Faker::Creature::Animal.name, first_name: Faker::Name.name, last_name: Faker::Name.name, status: 0 })
end

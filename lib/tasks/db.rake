namespace :db do
  desc "TODO"
  task repopulate: :environment do
  end
  
  desc "Generate dummy data"
  task fakeit: :environment do
   require 'faker'
    5.times do
      Game.create!(
        description: Faker::Name.name,
      )
    end
  end

end

class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :home_team
      t.string :visiting_team
      t.integer :game_status
      t.datetime :game_time
      t.references :leagues, foreign_key: true
      t.timestamps
    end
  end
end

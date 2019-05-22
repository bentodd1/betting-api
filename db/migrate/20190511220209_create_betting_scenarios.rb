class CreateBettingScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :betting_scenarios do |t|
      t.string :description
      t.references :game, foreign_key: true
      t.integer :scenario_type
      t.decimal :value
      t.timestamps
    end
  end
end

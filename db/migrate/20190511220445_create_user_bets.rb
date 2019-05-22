class CreateUserBets < ActiveRecord::Migration[5.2]
  def change
    create_table :user_bets do |t|
      t.references :user, foreign_key: true
      t.references :betting_scenario, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end

class CreateUserAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_accounts do |t|
      t.references :user, foreign_key: true, unique: true
      t.decimal :ammount_free
      t.decimal :ammount_in_play

      t.timestamps
    end
  end
end

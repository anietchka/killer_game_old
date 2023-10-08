class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :player_code
      t.string :status, null: false
      t.string :player_type, null: false
      t.references :game, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end

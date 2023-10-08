class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :status, null: false
      t.string :game_type, null: false
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :status
      t.string :game_type
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

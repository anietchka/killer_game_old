class CreateKills < ActiveRecord::Migration[7.0]
  def change
    create_table :kills do |t|
      t.integer :target_code, null: false
      t.boolean :executed, default: false
      t.datetime :finish_at
      t.references :player, null: false, foreign_key: true
      t.references :mission, null: false, foreign_key: true

      t.timestamps
    end
  end
end

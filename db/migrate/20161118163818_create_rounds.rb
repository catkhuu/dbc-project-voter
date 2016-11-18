class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.integer :pitch_id, null: false

      t.timestamps(null: false)
    end
  end
end

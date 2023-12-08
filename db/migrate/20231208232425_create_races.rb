class CreateRaces < ActiveRecord::Migration[7.1]
  def change
    create_table :races, id: :uuid do |t|
      t.string :name, null: false
      t.datetime :held_at, null: false
      t.integer :status, null: false
      t.references :restriction, null: false, foreign_key: true, type: :uuid
      t.integer :horses_count, null: false
      t.datetime :deadline, null: false

      t.timestamps
    end
  end
end

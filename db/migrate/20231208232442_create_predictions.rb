class CreatePredictions < ActiveRecord::Migration[7.1]
  def change
    create_table :predictions, id: :uuid do |t|
      t.string :twitter_id, null: false
      t.string :twitter_account
      t.references :race, null: false, foreign_key: true, type: :uuid
      t.jsonb :prediction, null: false
      t.boolean :is_won
      t.integer :order
      t.boolean :is_management, default: false, null: false

      t.timestamps
    end

    add_index :predictions, [:race_id, :twitter_id], unique: true
  end
end

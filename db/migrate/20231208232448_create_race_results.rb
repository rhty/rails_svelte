class CreateRaceResults < ActiveRecord::Migration[7.1]
  def change
    create_table :race_results, id: :uuid do |t|
      t.references :race, null: false, foreign_key: true, type: :uuid
      t.jsonb :result_data, null: false

      t.timestamps
    end
  end
end

class CreateRestrictions < ActiveRecord::Migration[7.1]
  def change
    create_table :restrictions, id: :uuid do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.text :format, null: false

      t.timestamps
    end
  end
end

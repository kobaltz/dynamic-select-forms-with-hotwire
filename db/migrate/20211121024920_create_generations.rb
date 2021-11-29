class CreateGenerations < ActiveRecord::Migration[7.0]
  def change
    create_table :generations do |t|
      t.belongs_to :brand, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end

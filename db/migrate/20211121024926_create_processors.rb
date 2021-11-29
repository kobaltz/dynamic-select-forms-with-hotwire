class CreateProcessors < ActiveRecord::Migration[7.0]
  def change
    create_table :processors do |t|
      t.belongs_to :brand, null: false, foreign_key: true
      t.belongs_to :generation, null: false, foreign_key: true
      t.string :name
      t.integer :cores

      t.timestamps
    end
  end
end

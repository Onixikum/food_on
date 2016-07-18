# table food
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.integer :food_type

      t.timestamps
    end
    add_index :products, [:food_type, :created_at]
  end
end

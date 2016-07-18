# table orders
class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :dish1_id
      t.integer :dish2_id
      t.integer :dish3_id
      t.integer :user_id
      t.string :address

      t.timestamps
    end
    add_index :orders, [:user_id, :created_at]
  end
end

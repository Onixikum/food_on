# Ordering is done at the company
class AddCompanyToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :company_id, :integer
    add_index :orders, :company_id
  end
end

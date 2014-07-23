class AddCustomerAddedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :customer_added, :boolean, :default => false
  end
end

class AddSoldValueToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sold_value, :boolean, :default => 0
  end
end

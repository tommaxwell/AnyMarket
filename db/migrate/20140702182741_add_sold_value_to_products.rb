class AddSoldValueToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sold_value, :boolean, :default => 'f'
  end
end

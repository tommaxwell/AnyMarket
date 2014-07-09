class AddDecimalPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :decimal_price, :decimal, :precision => 8, :scale => 2
  end
end

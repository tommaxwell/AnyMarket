class AddAboutDeliveryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :about_delivery, :text
  end
end

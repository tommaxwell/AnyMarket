class AddCreditCardToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credit_card, :integer
  end
end

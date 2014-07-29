class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.text :username
			t.string :email
      t.timestamps
    end
  end
end

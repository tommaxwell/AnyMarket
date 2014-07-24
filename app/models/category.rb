class Category < ActiveRecord::Base
  has_many :products, -> { order "created_at DESC" }, :foreign_key => :category_id
end

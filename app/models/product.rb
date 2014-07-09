class Product < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
  def set_user!(user)
    self.user_id = user.id

    self.save!
  end
end

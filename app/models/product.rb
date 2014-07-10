class Product < ActiveRecord::Base
  before_save :delete_photo, if: ->{ destroy_photo == '1' && !photo_updated_at_changed? }
  
  belongs_to :user
  attr_accessor :destroy_photo
  has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  
  
  def set_user!(user)
    self.user_id = user.id

    self.save!
  end
  
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
  private
  
  def delete_photo 
    self.photo.destroy
  end
  
end

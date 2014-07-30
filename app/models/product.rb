class Product < ActiveRecord::Base
  before_save :delete_photo, if: ->{ destroy_photo == '1' && !photo_updated_at_changed? }
  belongs_to :user
  belongs_to :category, :foreign_key => :category_id
  attr_accessor :destroy_photo
	has_attached_file :photo, :styles => {:medium => "400x400>", :thumb => "100x100>"},:storage => :s3, :s3_credentials => {:bucket => ENV['S3_BUCKET_NAME'],:access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
		
  validates_attachment :photo, :content_type => { :content_type => ["image/jpeg","image/png"]}
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
  
  
  def set_user!(user)
    self.user_id = user.id

    self.save!
  end
  
  private
  
  def delete_photo 
    self.photo.destroy
  end
  
end

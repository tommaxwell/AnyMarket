class Product < ActiveRecord::Base
  before_save :delete_photo, if: ->{ destroy_photo == '1' && !photo_updated_at_changed? }
  belongs_to :user
  belongs_to :category, :foreign_key => :category_id
  attr_accessor :destroy_photo
	has_attached_file :photo, :styles => {:large => "600x600>", :medium => "400x400>", :thumb => "100x100>"}
		
  validates_attachment :photo, :content_type => { :content_type => ["image/jpeg","image/png"]}
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
	include PgSearch
	multisearchable :against => [:name, :description]
	
	def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end
  
  def set_user!(user)
    self.user_id = user.id

    self.save!
  end
  
  private
  
  def delete_photo 
    self.photo.destroy
  end
  
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  acts_as_messageable
  
  def name
    email
  end

  def mailboxer_email(object)
    email
  end

  has_many :products
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "30x30>"}
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg","image/png"]}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
end

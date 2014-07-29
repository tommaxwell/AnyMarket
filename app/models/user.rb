class User < ActiveRecord::Base
  after_validation :set_school
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmation

  
  FIELDS = [:phone, :website, :company, :fax, :addresses, :credit_cards]
  
  SCHOOLS = {"berkeley.edu" => "University of California, Berkeley", "uw.edu" => "University of Washington"}
  
  def set_school 
    self.school = SCHOOLS[self.email.split("@").last]
  end
  
  attr_accessor *FIELDS
  
  acts_as_messageable
  
  def name
    email
  end

  def mailboxer_email(object)
    email
  end
  
  
  has_many :products, -> { order "created_at DESC" }
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "30x30>"}, :default_url => "default.png"
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg","image/png"]}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/\
  
  def has_payment_info?
    !!braintree_customer_id
  end

  def with_braintree_data!
    return self unless has_payment_info?
    braintree_data = Braintree::Customer.find(braintree_customer_id)

    FIELDS.each do |field|
      send(:"#{field}=", braintree_data.send(field))
    end
    self
  end

  def default_credit_card
    return unless has_payment_info?

    credit_cards.find { |cc| cc.default? }
  end
  
end
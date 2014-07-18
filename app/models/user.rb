class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  FIELDS = [:first_name, :last_name, :phone, :website, :company, :fax, :addresses, :credit_cards]
  
  attr_accessor *FIELDS
  
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
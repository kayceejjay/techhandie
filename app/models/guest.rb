# Model without the use of ActiveRecord & a database

class Guest
  include ActiveModel::Model
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  include ActiveModel::Callbacks
  include ActiveModel::Dirty
  
  
  attr_accessor :fname, :lname, :phone, :email, :interest
  
  # Validations & Requirements
  # validates_presence_of, validates_format_of, validates_length_of
  
  validates :fname, presence: true, length: { maximum: 50 }
  validates :lname, presence: true, length: { maximum: 50 }
  validates :lname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  # validates_uniqueness_for :email # { case_sensitive: false } - not applicable
  validates :interest, presence: true

  # Dirty Setup - Tracking Attribute Changes
  define_attribute_methods :fname, :lname, :phone, :email, :interest
  
  def fname; @fname; end
  def fname=(value); fname_will_change!; @fname=value; end
    
  def lname; @lname; end
  def lname=(value); lname_will_change!; @lname=value; end
    
  def phone; @phone; end
  def phone=(value); phone_will_change!; @phone=value; end
    
  def email; @email; end
  def email=(value); email_will_change!; @email=value; end
    
  def interest; @interest; end
  def interest=(value); interest_will_change!; @interest=value; end
  
  def save; @guest = {fname: @fname, lname: @lname, phone: @phone, email: @email, interest: @interest}; changes_applied; end
    
  def initialize(attributes = {})
    
    # super
    # @fname = fname
    # @lname = lname
    # @phone = phone
    # @email = email
    # @interest = interest
    
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    
    @attr_number = set_attr_number
    
    post_initialize
  end

  # def persisted?
  #   self.changed? ? true : false
  # end

# Guest#make in lieu of Guest#create
  def self.make(fname, lname, phone, email, interest)
    attributes = {fname: fname, lname: lname, phone: phone, email: email, interest: interest}
    object = new(attributes)
    object.save
    @guest = object
    @guest
  end

  def send_mail
    # Following method defined in NotifierMailer
    NotifierMailer.guest_info(self).deliver_now
  end


  private
  
  def set_attr_number
    number_attributes = 5
    number_attributes
  end
  
  def post_initialize
    if email
      email.downcase
    end
  end
  
  def downcase_email
    self.email = email.downcase
  end
  
end
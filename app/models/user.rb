class User
  include MongoMapper::Document

  timestamps!

  devise :all, :except => :validatable
  
  # Email regex used to validate email formats. Retrieved from authlogic.
  EMAIL_REGEX = /\A[\w\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2,4}|museum|travel)\z/i

  validates_presence_of :email
  validates_uniqueness_of :email, :allow_blank => true
  validates_format_of :email, :with => EMAIL_REGEX, :allow_blank => true

  validates_presence_of :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of :password, :within => 6..20, :allow_blank => true, :if => :password_required?

  protected

    def password_required?
      new_record? || !password.nil? || !password_confirmation.nil?
    end

end

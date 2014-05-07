class Guest < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password, :password_confirmation, :token
  before_create { generate_token(:token) }

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :password, :length => { :minimum => 6 }, :on => :create

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Admin.exists?(column => self[column])
  end


  def self.auth_guest(username,password)
    guest = self.find_by_name(username)
    if guest && guest.authenticate(password)
      true;
    else
      false;
    end
  end


  

end

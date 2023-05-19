class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates_uniqueness_of :email
  validates :password, presence: { on: create }, length: { minimum: 8 }
  validates :password_confirmation, presence: { on: create }, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    # if successfully authenticated return instance of the user
    # else return nill
    email = email.gsub(/\s+/, "").downcase
    user = User.find_by_email(email)
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(password)
        # Save the user id inside the browser cookie. This is how we keep the user 
        # logged in when they navigate around our website.
        user
      else
        nil
      end
    
  end

  
end
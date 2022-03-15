class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  has_secure_password

  def self.authenticate_with_credentials(email, password)

    user = User.find_by_email(email.strip.downcase)
    if (user && user.authenticate(password))
      return user
    else 
      return false
    end

  end

end

class User < ActiveRecord::Base
  has_secure_password

  validates :password, :length => {
    :minimum => 8,
    :too_short => 'password must be 8 characters'
  }, :on => :create

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    valid_email = email.downcase.strip
    user = User.find_by_email(valid_email)
    if user.authenticate(password)
      return user
    else
      return nil
    end

  end

end

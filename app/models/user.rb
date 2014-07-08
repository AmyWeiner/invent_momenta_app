class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  has_one :profile

  has_secure_password

  validates :username,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: true }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  VALID_PASSWORD_REGEX = /\A.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*[\d\W]).*\z/
  validates :password, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX, message: "must include at least one uppercase letter, one lowercase letter, and one digit or symbol." }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private 

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end

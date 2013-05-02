class User < ActiveRecord::Base
  has_secure_password
  has_many :decks

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :password, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: email_regex }

  before_create :generate_auth_token

private
  def generate_auth_token
    begin
      self.auth_token = SecureRandom.urlsafe_base64
    end while User.exists? auth_token: auth_token
  end
end

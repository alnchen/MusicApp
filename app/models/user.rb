class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :session_token, uniqueness: true, presence: true
  validates :password_digest, uniqueness: true, presence: true
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password).to_s
  end

  def is_password?(password)
    Bcrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by(email: email)
    return nil if @user.nil?
    @user.is_password?(password) ? @user : nil
  end
end

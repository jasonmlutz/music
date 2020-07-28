# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  email                   :string           not null
#  password_digest         :string           not null
#  session_token           :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  activated               :boolean          default(FALSE), not null
#  activation_token_digest :string
#  admin                   :boolean          default(FALSE)
#
class User < ApplicationRecord
  attr_reader :password
  after_initialize :ensure_session_token
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  has_many :notes,
    class_name: :Note,
    foreign_key: :author_id,
    dependent: :destroy

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def is_activation_token?(activation_token)
    BCrypt::Password.new(activation_token_digest).is_password?(activation_token)
  end

  def self.find_by_activation_token(email, activation_token)
    user = User.find_by(email: email)
    (user.nil? || !user.is_activation_token?(activation_token)) ? nil : user
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user.nil? || !user.is_password?(password) ? nil : user
  end

  def activate!
    self.activated = true
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end

class User < ApplicationRecord
  USER_PARAMS = %i[name email password password_confirmation].freeze
  before_save :downcase_email # treat email as unique but ignore case
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 255 }
  validates(:email, presence: true, length: { maximum: 255 }, format: { with:
    VALID_EMAIL_REGEX }, uniqueness: true)
  validates :password, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  has_secure_password # this will validate presence of password

  private

  def downcase_email
    self.email = email.downcase
  end
end

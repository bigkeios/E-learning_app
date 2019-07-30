class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: {maximum:255}
    validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX}
    validates :password, length: {minimum:5}
    validates :password_confirmation, presence: true
    has_secure_password #this will validate presence of password
end

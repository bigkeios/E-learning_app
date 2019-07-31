class User < ApplicationRecord
    before_save :downcase_email #treat email as unique but ignore case
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: {maximum:255}
    validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX}, uniqueness: true
    validates :password, length: {minimum:5}, allow_nil: true #allow_nil is for edit info
    # no need to validate presence of password confirmation bc if it is nil but password is not, they still do not match
    has_secure_password #this will validate presence of password

    private
    def downcase_email
        self.email = email.downcase
    end
end

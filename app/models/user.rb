class User < ApplicationRecord
  has_many :followings, class_name: "UserFollow", foreign_key: "follower_id",
                        dependent: :destroy
  has_many :followed_users, through: :followings, source: :followed
  has_many :followeds, class_name: "UserFollow", foreign_key: "followed_id",
                       dependent: :destroy
  has_many :following_users, through: :followeds, source: :follower

  USER_PARAMS = %i[name email password password_confirmation].freeze
  # treat email as unique but ignore case
  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 255 }
  # treat email as unique but ignore case
  validates :email, presence: true, length: { maximum: 255 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: { case_sensitive: false }
  # allow_nil is for edit info
  validates :password, length: { minimum: 5 }, allow_nil: true
  # this will validate presence of password
  has_secure_password

  def follow other_user
    followings.create(followed_id: other_user.id)
  end

  def unfollow other_user
    followings.find_by(followed_id: other_user.id).destroy
  end

  def following? other_user
    followed_users.include?(other_user)
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end

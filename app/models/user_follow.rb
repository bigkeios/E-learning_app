class UserFollow < ApplicationRecord
  belongs_to :follower, class_name: User.model_name, foreign_key: "follower_id"
  belongs_to :followed, class_name: User.model_name, foreign_key: "followed_id"
end

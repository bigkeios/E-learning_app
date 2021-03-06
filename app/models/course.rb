class Course < ApplicationRecord
  validates :name, presence: true, length: { minimum: 10, maximum: 255 }
  validates :desc, presence: true, length: { minimum: 50 }
  default_scope { where(deleted: false) }
  has_many :lessons
end

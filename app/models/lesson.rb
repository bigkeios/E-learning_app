class Lesson < ApplicationRecord
  belongs_to :course, dependent: :destroy

  validates :name, presence: true, length: { minimum: 10, maximum: 255 }
  validates :objective, presence: true, length: { minimum: 50 }
end

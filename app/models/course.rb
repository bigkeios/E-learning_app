class Course < ApplicationRecord
  validates :name, presence: true
  validates :desc, presence: true
end
class Question < ApplicationRecord
  belongs_to :word
  belongs_to :answer
  belongs_to :lesson
end

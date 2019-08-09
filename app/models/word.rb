class Word < ApplicationRecord
  belongs_to :category
  default_scope {where(deleted: false)}
end

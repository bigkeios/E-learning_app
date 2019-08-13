class Category < ApplicationRecord
  has_many :words
  require 'csv'
  def import_words(file)
    CSV.foreach(file, headers: true) do |row|
      ActiveRecord::Base.transaction do
        words.create! row.to_hash
      end
      true
    rescue ActiveRecord::UnknownAttributeError
      false
    end
  end
end

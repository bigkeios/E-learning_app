class Category < ApplicationRecord
  has_many :words
  require 'csv'
  def import_words(file)
    CSV.foreach(file, headers: true) do |row|
      word = words.build row.to_hash
      return false unless word.save
    end
    true
  end
end

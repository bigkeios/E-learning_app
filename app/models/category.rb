class Category < ApplicationRecord
  has_many :words
  require 'csv'
  def import_words(file)
    CSV.foreach(file, headers: true).with_index(1) do |row, line|
      ActiveRecord::Base.transaction do
        words.create! row.to_hash
      end
    rescue ActiveRecord::UnknownAttributeError
      return line
    end
    nil
  end
end

class Category < ApplicationRecord
  require 'csv'
  class << self
    def import(file)
      CSV.foreach(file, headers: true) do |row|
        Category.create! row.to_hash
      end
    end
    end
end

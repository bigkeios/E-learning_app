class AddDeletedToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :deleted, :boolean, default: false
  end
end

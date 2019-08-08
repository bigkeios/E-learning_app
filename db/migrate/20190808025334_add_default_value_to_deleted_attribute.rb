class AddDefaultValueToDeletedAttribute < ActiveRecord::Migration[6.0]
  def up
    change_column_default :courses, :deleted, false
  end

  def down
    change_column_default :courses, :deleted, nil
  end
end

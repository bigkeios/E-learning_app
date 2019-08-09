class RemoveNoteFromAnswer < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :note, :string
  end
end

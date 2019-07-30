class CreateLessonResults < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_results do |t|
      t.integer :correct_ans
      t.references :user
      t.references :lesson

      t.timestamps
    end
  end
end

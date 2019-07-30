class AddLessonToLessonResults < ActiveRecord::Migration[6.0]
  def change
    add_reference :lesson_results, :lesson, null: false, foreign_key: true
  end
end

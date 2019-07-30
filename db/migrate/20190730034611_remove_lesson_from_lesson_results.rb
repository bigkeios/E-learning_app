class RemoveLessonFromLessonResults < ActiveRecord::Migration[6.0]
  def change
    remove_reference :lesson_results, :lesson
  end
end

class RemoveCourseFromCourseEnrolls < ActiveRecord::Migration[6.0]
  def change
    remove_reference :course_enrolls, :course
  end
end

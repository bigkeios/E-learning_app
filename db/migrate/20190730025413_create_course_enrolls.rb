class CreateCourseEnrolls < ActiveRecord::Migration[6.0]
  def change
    create_table :course_enrolls do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course

      t.timestamps
    end
  end
end

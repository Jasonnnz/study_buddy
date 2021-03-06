class CreateStudentCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :student_courses do |t|
      t.integer :student_id
      t.integer :course_id
      t.boolean :completed
      t.integer :school_course_id
      t.integer :grade, default: nil

      t.timestamps
    end
  end
end

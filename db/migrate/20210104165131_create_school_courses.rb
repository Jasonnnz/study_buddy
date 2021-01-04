class CreateSchoolCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :school_courses do |t|
      t.integer :school_id
      t.integer :course_id
      t.string :teacher

      t.timestamps
    end
  end
end

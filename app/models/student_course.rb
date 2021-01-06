class StudentCourse < ApplicationRecord
    belongs_to :student 
    belongs_to :course 
    belongs_to :school_course

    validates :grade, presence: true, if: :course_completed?
    validates :course_id, uniqueness: {scope: :student_id}, unless: :diff_school?
    # validates :course_id, uniqueness: {scope: :school_course_id}

    def course_completed?
        self.completed
    end

    def diff_school?
        self.student.school.id != self.school_course_id 
    end

end

class StudentCourse < ApplicationRecord
    belongs_to :student 
    belongs_to :course 
    belongs_to :school_course

    validates :grade, presence: true, if: :course_completed?
    validates :course_id, uniqueness: {scope: :student_id}

    def course_completed?
        self.completed
    end

end

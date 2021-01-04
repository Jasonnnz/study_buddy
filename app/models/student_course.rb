class StudentCourse < ApplicationRecord
    belongs_to :student 
    belongs_to :course 

    validates :grade, presence: true, if: :course_completed?

    def course_completed?
        self.completed
    end

end

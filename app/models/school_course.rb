class SchoolCourse < ApplicationRecord
    belongs_to :school 
    belongs_to :course
    has_many :student_courses 

    validates :teacher, presence: true 
    validates :course_id, uniqueness: {scope: :school_id}
end

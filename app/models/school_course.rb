class SchoolCourse < ApplicationRecord
    belongs_to :school 
    belongs_to :course

    validates :teacher, presence: true 
    validates :course_id, uniqueness: {scope: :school_id}
end

class Course < ApplicationRecord
    has_many :student_courses, dependent: :destroy
    has_many :students, through: :student_courses
    has_many :school_courses
    has_many :schools, through: :school_courses

    validates :name, presence: true 
    validates :name, uniqueness: true

    def self.search(search)
        if search 
            course = Course.find_by(name: search)
            if course
                self.where(name: course.name)
            end
        else
            Course.all
        end
    end
end

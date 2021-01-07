class Course < ApplicationRecord
    has_many :student_courses, dependent: :destroy
    has_many :students, through: :student_courses
    has_many :course_courses
    has_many :schools, through: :school_courses

    validates :name, presence: true 
    validates :name, uniqueness: true

    # def self.search(search)
    #     if search 
    #         course = Course.find_by(name: search.strip)
    #         if course
    #             self.where(name: course.name)
    #         end
    #     else
    #         Course.all
    #     end
    # end
    def self.search(search)
        courses = self.all  
        arr_courses = courses.select {|course| course.name.downcase.include?(search.downcase)}
    end
end

class School < ApplicationRecord
    has_many :school_courses
    has_many :courses, through: :school_courses
    has_many :students

    validates :name, :location, presence: true 
    validates :name, uniqueness: true 

    def self.search(search)
        if search 
            school = School.find_by(name: search)
            if school 
                self.where(name: school.name)
            end
        else
            School.all
        end
    end
end

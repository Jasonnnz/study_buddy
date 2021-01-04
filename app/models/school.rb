class School < ApplicationRecord
    has_many :school_courses
    has_many :courses, through: :school_courses
    has_many :students

    validates :name, :location, presence: true 
    validates :name, uniqueness: true 

end

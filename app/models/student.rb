class Student < ApplicationRecord
    has_many :student_courses, dependent: :destroy
    has_many :courses, through: :student_courses

    has_many :followed_students, foreign_key: :follower_id, class_name: 'Friendship'
    has_many :followees, through: :followed_students
  
    has_many :following_students, foreign_key: :followee_id, class_name: 'Friendship'
    has_many :followers, through: :following_students

    belongs_to :school

    validates :name, :username, :email, presence: true
    validates :username, :email, uniqueness: true 
    validates :password, length: {minimum: 6, maximum: 20}
    validates :password_confirmation, presence: true

    has_secure_password
end

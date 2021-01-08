class Student < ApplicationRecord
    has_many :student_courses, dependent: :destroy
    has_many :courses, through: :student_courses

    has_many :followed_students, foreign_key: :follower_id, class_name: 'Friendship', dependent: :destroy
    has_many :followees, through: :followed_students, dependent: :destroy
  
    has_many :following_students, foreign_key: :followee_id, class_name: 'Friendship', dependent: :destroy
    has_many :followers, through: :following_students, dependent: :destroy

    belongs_to :school

    validates :name, :username, :email, presence: true
    validates :username, :email, uniqueness: true 
    validates :password, length: {minimum: 6, maximum: 20}
    validates :password_confirmation, presence: true

    has_one_attached :img_url, :dependent => :destroy 

    has_secure_password

    # def self.search(search)
    #     if search 
    #         student = Student.find_by(name: search.strip.capitalize)
    #         if student 
    #             self.where(name: student.name)
    #         end
    #     else
    #         Student.all
    #     end
    # end

    def self.search(search)
        students = self.all  
        arr_students = students.select {|student| student.name.downcase.include?(search.strip.downcase)}
    end

end

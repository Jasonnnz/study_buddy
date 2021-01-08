class Friendship < ApplicationRecord
    belongs_to :follower, class_name: "Student"
    belongs_to :followee, class_name: "Student"

    validates :follower, uniqueness: {scope: :followee}
end

# School.create(name: "Fordham", location: "Manhattan, NY")
50.times do 
    School.create(name: Faker::Educator.university, location: Faker::Address.full_address)
end
# Course.create(name: "CS 101")
50.times do 
    Course.create(name: Faker::Educator.course_name)
end
# Student.create(name: "Eric", username: "eric", password: "abc123", email: "eric@gmail.com", school_id: 1, img_url: "", password_confirmation: "abc123")
20.times do 
    Student.create(name: Faker::Name.name, username: Faker::Games::Pokemon.name, password: "abc123", email: Faker::Internet.email, school_id: School.all.sample.id, password_confirmation: "abc123")
end

50.times do
    SchoolCourse.create(school_id: School.all.sample.id, course_id: Course.all.sample.id, teacher: Faker::Movies::HarryPotter.character)
end
# SchoolCourse.create(school_id: 1, course_id: 1, teacher: "Mr.Ori")

50.times do
    StudentCourse.create(student_id: Student.all.sample.id, course_id: Course.all.sample.id, completed: false, grade: nil, school_course_id: SchoolCourse.all.sample.id)
end

puts "Data Seeded!"
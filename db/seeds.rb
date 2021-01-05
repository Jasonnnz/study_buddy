School.create(name: "Fordham", location: "Manhattan, NY")
Course.create(name: "CS 101")
Student.create(name: "Eric", username: "eric", password: "abc123", email: "eric@gmail.com", school_id: 1, img_url: "", password_confirmation: "abc123")
SchoolCourse.create(school_id: 1, course_id: 1, teacher: "Mr.Ori")
StudentCourse.create(student_id: 1, course_id:1, completed: false, grade: "", school_course_id: 1)

puts "Data Seeded!"
School.create(name: "Fordham", location: "Manhattan, NY")
Course.create(name: "CS 101")
Student.create(name: "Eric Kim", username: "eric", password: "a", email: "eric@gmail.com", school_id: 1, img_url: "")
SchoolCourse.create(school_id: 1, course_id: 1, teacher: "Mr.Ori")

puts "Data Seeded!"
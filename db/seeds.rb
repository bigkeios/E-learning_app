# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# USERS
User.create(name: "admin", email: "admin@example.org", password: "password",
            password_confirmation: "password", admin: true)
50.times do |i|
  name = Faker::Name.name
  email = "example_#{i + 1}@example.org"
  password = "password"
  User.create(name: name, email: email, password: password,
              password_confirmation: password)
end

# FOLLOWING
users = User.all
user = users.first
followed_users = users[2..10]
following_users = users[11..30]
followed_users.each do |flwed_user|
  user.follow(flwed_user)
end
following_users.each do |flwing_user|
  flwing_user.follow(user)
end

# COURSE
10.times do
  name = Faker::Lorem.sentence
  desc = Faker::Lorem.paragraph(sentence_count: 5)
  course = Course.create(name: name, desc: desc)
  3.times do
    lesson_name = Faker::Lorem.sentence
    lesson_objective = Faker::Lorem.paragraph(sentence_count: 5)
    course.lessons.create(name: lesson_name, objective: lesson_objective)
  end
end

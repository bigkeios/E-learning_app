# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# USERS
50.times do
    name = Faker::Name.name
    email = Faker::Internet.unique.email
    password = 'password'
    User.create(name: name, email: email, password: password, password_confirmation: password)
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
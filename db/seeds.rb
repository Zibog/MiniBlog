# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user
User.create!(name: "Example User", email: "dummy@example.com", password: "password",
                password_confirmation: "password", admin: true, activated: true,
                activated_at: Time.zone.now)

# Generate additional users
49.times do |n|
    name = Faker::Name.name
    email = "dummy#{n+1}@example.com"
    password = "password"
    User.create!(name: name, email: email, password: password, 
                    password_confirmation: password, activated: true,
                    activated_at: Time.zone.now)
end

# Generate microposts for a subset of users
users = User.order(:created_at).take(5)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!(content: content) }
end

# Create relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |f| user.follow(f) }
followers.each { |f| f.follow(user) }

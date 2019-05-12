User.create!(name:  "Sample User",
             email: "sample@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
name  = Faker::Name.name
email = "sample-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
             email: email,
             password:              password,
             password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(body: content) }
end

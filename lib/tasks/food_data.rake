namespace :db do
  desc "Fill database with food data"
  task populate: :environment do
    User.create!(name: "User",
                 email: "user@mail.com",
                 password: "xxxxxxxx",
                 password_confirmation: "xxxxxxxx",
                 admin: true)
    99.times do |n|
      name = Faker::Name.name
      email = "user-#{n+1}@mail.com"
      password = "xxxxxxxx"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
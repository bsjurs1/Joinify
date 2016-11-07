# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


1000.times do |i|
  
  User.create(
    username: "user#{i}",
    password: "password#{i}",
    password_confirmation: "password#{i}",
    email: "user#{i}@example.com"
  )

  Event.create(
    title: "event#{i}",
    start_date: Time.now + i.days,
    description: "Description for event#{i}",
    is_public: (i % 2) == 1,
    owner_id: i
  )
end
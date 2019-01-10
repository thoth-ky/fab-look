# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserProfile.create(
  [
    {
      fullnames: Faker::Name.name,
      bio: Faker::Lorem.paragraph,
      avatar: Faker::Internet.url,
      phonenumber: Faker::PhoneNumber.cell_phone,
      location: "#{Faker::Address.latitude}, #{Faker::Address.longitude}",
      occupation: Faker::Lorem.word,
      website: Faker::Internet.url
    },
    {
      fullnames: Faker::Name.name,
      bio: Faker::Lorem.paragraph,
      avatar: Faker::Internet.url,
      phonenumber: Faker::PhoneNumber.cell_phone,
      location: "#{Faker::Address.latitude}, #{Faker::Address.longitude}",
      occupation: Faker::Lorem.word,
      website: Faker::Internet.url
    }
  ]
)

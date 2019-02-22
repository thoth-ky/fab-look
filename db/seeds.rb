# frozen_string_literal: true

UserProfile.create(
  [
    {
      fullnames: Faker::Name.name,
      bio: Faker::Lorem.paragraph,
      avatar: nil,
      phonenumber: Faker::PhoneNumber.cell_phone,
      location: "#{Faker::Address.latitude}, #{Faker::Address.longitude}",
      occupation: Faker::Lorem.word,
      website: Faker::Internet.url
    },
    {
      fullnames: Faker::Name.name,
      bio: Faker::Lorem.paragraph,
      avatar: nil,
      phonenumber: Faker::PhoneNumber.cell_phone,
      location: "#{Faker::Address.latitude}, #{Faker::Address.longitude}",
      occupation: Faker::Lorem.word,
      website: Faker::Internet.url
    }
  ]
)

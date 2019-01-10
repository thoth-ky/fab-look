# frozen_string_literal: true

FactoryBot.define do
  factory :user_profile do
    # ield :id, ID, null: false
    fullnames { Faker::Name.name }
    bio { Faker::Lorem.paragraph }
    avatar { Faker::Internet.url }
    phonenumber { Faker::PhoneNumber.cell_phone }
    location { "#{Faker::Address.latitude}, #{Faker::Address.longitude}" }
    occupation { Faker::Lorem.word }
    website { Faker::Internet.url }
    user
  end
end

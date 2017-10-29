FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Internet.user_name }
    nickname { Faker::Internet.user_name }
    meta { {'location': [Faker::Address.latitude, Faker::Address.longitude]} }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end

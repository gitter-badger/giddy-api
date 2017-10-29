FactoryBot.define do
  factory :activity do
    name { Faker::Name.first_name }
    description { Faker::Lorem.sentence }
    association :user, factory: [:user]
  end

  trait :with_track do 
    track { File.open("../fixtures/files/test_track.gpx") }
  end

  trait :with_track_image do 
    track_image { File.open("../fixtures/files/test_track_image.png") }
  end

  trait :with_attachements do
    track { File.open("../fixtures/files/test_track.gpx") }
    track_image { File.open("../fixtures/files/test_track_image.png") } 
  end
end

Fabricator(:activity) do
  name  { Faker::Lorem.sentence }
  description { Faker::Lorem.paragraph }
end

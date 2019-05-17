FactoryBot.define do
  factory :post do
    body { Faker::Lorem.sentence(5) }
    user
    # body "My test post"
  end
end

FactoryBot.define do
  factory :post do
    body { Faker::Lorem.sentence(5) }
    user
  end
end

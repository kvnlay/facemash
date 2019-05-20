FactoryBot.define do
  factory :post do
    body { 'Fake post' }
    user
  end
end

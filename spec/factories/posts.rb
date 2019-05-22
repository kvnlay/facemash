FactoryBot.define do
  factory :post do
    user
    body { 'Fake post'}
  end
end

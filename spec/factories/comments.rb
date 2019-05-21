FactoryBot.define do
  factory :comment do
    post
    user
    content { 'Fake comment' }
  end
end

FactoryBot.define do
  factory :user, aliases: [:requester, :requested] do
    name { Faker::Name.name }
    email { Faker::Internet.email}
    password { 'password' }
    password_confirmation { 'password' }
  end
end
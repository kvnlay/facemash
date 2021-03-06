FactoryBot.define do
  factory :user, aliases: [:requester, :requested, :sent_friend, :received_friend] do
    name { Faker::Name.name }
    email { Faker::Internet.email}
    password { 'password' }
    password_confirmation { 'password' }

    factory :friend do
      name { 'Kingsley Omotayo' }
      email { Faker::Internet.email}
    end
  end
end
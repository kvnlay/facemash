FactoryBot.define do
  factory :friend_request do
    requester
    requested
  end

  factory :invalid_friend_request do
  end
end

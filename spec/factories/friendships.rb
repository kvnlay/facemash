FactoryBot.define do
  factory :friendship do
    sent_friend
    received_friend
  end

  factory :invalid_friendship, class: 'Friendship' do
    sent_friend { nil }
    received_friend
  end
end

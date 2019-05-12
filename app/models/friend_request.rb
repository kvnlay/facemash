class FriendRequest < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :requested, class_name: 'User'

  validates :requester, presence: true
  validates :requested, presence: true
end

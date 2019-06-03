class FriendRequest < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :requested, class_name: 'User'

  validate :not_friends
  validate :not_pending
  validate :not_self

  private

  def not_friends
    errors.add(:requested, 'is already added') if requester.friends.include?(requested)
  end

  def not_pending
    errors.add(:requested, 'already requested friendship') if requester.sent_requests.include?(requested) || 
                                                              requester.received_requests.include?(requested)
  end

  def not_self
    errors.add(:requested, 'Can\'t be equal to requester') if requester == requested
  end
end

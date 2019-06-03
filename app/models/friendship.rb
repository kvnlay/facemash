class Friendship < ApplicationRecord
  after_create :delete_request

  belongs_to :sent_friend, class_name: 'User', foreign_key: 'adder_id'
  belongs_to :received_friend, class_name: 'User', foreign_key: 'added_id'

  validate :friend_is_self

  private

  def friend_is_self
    errors.add(:adder, "cannot add self as friend") if adder_id == added_id
  end

  def delete_request
    return unless request = FriendRequest.find_by(requester_id: sent_friend.id,
                                    requested_id: received_friend.id)
    request&.destroy
  end
end

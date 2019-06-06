class Friendship < ApplicationRecord
  after_create :delete_request

  belongs_to :sent_friend, class_name: 'User', foreign_key: 'adder_id'
  belongs_to :received_friend, class_name: 'User', foreign_key: 'added_id'

  validates :adder_id, uniqueness: { scope: :added_id }

  private

  def delete_request
    return unless (request = FriendRequest.find_by(requester_id: sent_friend.id,
                                                  requested_id: received_friend.id))

    request&.destroy
  end
end

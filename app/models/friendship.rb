class Friendship < ApplicationRecord
  # after_create :create_mutual_relationship
  # after_destroy :destroy_mutual_relationship

  # belongs_to :user
  # belongs_to :friend, class_name: 'User'
  belongs_to :sent_friend, class_name: 'User', foreign_key: 'adder_id'
  belongs_to :received_friend, class_name: 'User', foreign_key: 'added_id'

  validate :friend_is_self

  private

  def friend_is_self
    errors.add(:adder, "cannot add self as friend") if adder_id == added_id
  end
end

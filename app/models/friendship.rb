class Friendship < ApplicationRecord
  # after_create :create_mutual_relationship
  # after_destroy :destroy_mutual_relationship

  belongs_to :user
  # belongs_to :friend, class_name: 'User'
  belongs_to :sent_friend, class_name: 'User', foreign_key: 'adder_id',
                                               primary_key: :id
  belongs_to :received_friend, class_name: 'User', foreign_key: 'added_id',
                                               primary_key: :id

  # validate :not_self
  validates :added_id, presence: true, uniqueness: {
    scope: :adder_id
  }

  # private

  # def not_self
  #   errors.add(:added, "can't be friends with self") if adder == added
  # end
end

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: { maximum: 200 }

  scope :with_comments_and_likes, -> { includes(:user, :comments, :likes) }
  scope :user_friends, lambda { |user|
    where(user_id: user.sent_friendships.pluck(:added_id) +
                    user.received_friendships.pluck(:adder_id) +
                    user.id)
  }
end

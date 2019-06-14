class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: { maximum: 200 }

  scope :with_comments_and_likes,
        lambda {
          includes(
            :user,
            :likes,
            comments: [:user]
          )
        }
end

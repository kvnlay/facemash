class Post < ApplicationRecord
validates :user, presence: true
validates :body, presence: true, length: { maximum: 200 }

  belongs_to :user
  has_many :comments
  has_many :likes
end

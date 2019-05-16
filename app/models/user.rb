class User < ApplicationRecord
  before_save { email.downcase! }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :received_requests, foreign_key: "requested_id", 
                                class_name: "FriendRequest", 
                                dependent: :destroy
  has_many :sent_requests, foreign_key: "requester_id", 
                            class_name: "FriendRequest", 
                            dependent: :destroy
  has_many :requesters, through: :received_requests, source: :requester
  has_many :requesteds, through: :sent_requests, source: :requested

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, class_name: 'User'

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def remove_friend(friend)
    current_user.friend.destroy(friend)
  end
end

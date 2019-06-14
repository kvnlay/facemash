class User < ApplicationRecord
  before_save { email.downcase! }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]
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

  # has_many :friendships, dependent: :destroy
  # has_many :friends, through: :friendships, class_name: 'User'

  has_many :sent_friendships, class_name: 'Friendship',
                              foreign_key: :adder_id,
                              dependent: :destroy
  has_many :received_friendships, class_name: 'Friendship',
                                  foreign_key: :added_id,
                                  dependent: :destroy

  has_many :sent_friends, through: :received_friendships,
                          source: :sent_friend
  has_many :received_friends, through: :sent_friendships,
                              source: :received_friend

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :password, length: { minimum: 6 }, on: :create
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def friends
    sent_friends + received_friends
  end

  def all_friend_posts
    friend_ids = [id]
    friend_ids += friends.pluck(:id) unless friends.nil?
    friend_ids.uniq
    Post.where(user_id: friend_ids).order(created_at: :desc)
        .includes(:user, :comments, :likes)
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] &&  session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end
end

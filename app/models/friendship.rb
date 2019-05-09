class Friendship < ApplicationRecord
  after_create :create_mutual_relationship
  after_destroy :destroy_mutual_relationship

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  private

  def create_mutual_relationship
    Friendship.find_or_create_by(user_id: friend.id, friend_id: user.id)
  end

  def destroy_mutual_relationship
    friendship = Friendship.find_by(user_id: friend.id, friend_id: user.id)
    friendship&.destroy
  end
end

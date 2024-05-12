class Friendship < ApplicationRecord
  # validates :friend_id, :user_id, uniqueness: true

  after_create :create_inverse_relationship

  belongs_to :user
  belongs_to :friend,class_name: "User", foreign_key: :friend_id


  private
  def create_inverse_relationship
    # @friend_ship = friend.friendships.new(friend: user)
    # @friend_ship.save
  end

  def destroy_inverse_relationship
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "friend_id", "id", "updated_at", "user_id"]
  end
end

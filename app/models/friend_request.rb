class FriendRequest < ApplicationRecord
  # validates :friend_id, :user_id, uniqueness: true

  belongs_to :user
  belongs_to :friend, class_name: 'User'


  def accept
    user.friends << friend
    friend.friends << user
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "friend_id", "id", "updated_at", "user_id"]
  end
end

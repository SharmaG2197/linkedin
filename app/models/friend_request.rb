class FriendRequest < ApplicationRecord
  # validates :friend_id, :user_id, uniqueness: true

  belongs_to :user
  belongs_to :friend, class_name: 'User'


  def accept
    user.friends << friend
    friend.friends << user
  end

end
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes
  has_one :profile

  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :messagee, foreign_key: :receiver_id, class_name: 'Message'  
  has_many :senders, through: :messagee
  has_many :messaged, foreign_key: :sender_id, class_name: 'Message'
  has_many :receivers, through: :messaged

  has_many :group_owners, class_name: "Group", foreign_key: :user_id

  has_many :members
  has_many :groups, through: :members
end
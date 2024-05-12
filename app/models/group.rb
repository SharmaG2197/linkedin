class Group < ApplicationRecord
  belongs_to :user

  has_many :members
  has_many :users, through: :members
  has_many :groupchats

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "group_name", "id", "updated_at", "user_id"]
  end
end

class Member < ApplicationRecord
  belongs_to :group
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "group_id", "id", "updated_at", "user_id"]
  end
end

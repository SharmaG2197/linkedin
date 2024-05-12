class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "post_id", "updated_at", "user_id"]
  end
end

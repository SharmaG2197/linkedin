class Comment < ApplicationRecord
  belongs_to :post

  def self.ransackable_attributes(auth_object = nil)
    ["comment_text", "created_at", "id", "post_id", "updated_at", "user_id"]
  end
end

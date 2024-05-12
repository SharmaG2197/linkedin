class Post < ApplicationRecord
  paginates_per 3
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  validates :title, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "title", "updated_at", "user_id"]
  end
end

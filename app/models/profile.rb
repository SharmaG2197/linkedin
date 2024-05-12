class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_pic, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["about", "address", "bio", "created_at", "dob", "id", "updated_at", "user_id", "username"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["profile_pic_attachment", "profile_pic_blob", "user"]
  end
end

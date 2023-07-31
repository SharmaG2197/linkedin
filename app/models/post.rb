class Post < ApplicationRecord
    paginates_per 3
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user
    validates :title, presence: true 
end

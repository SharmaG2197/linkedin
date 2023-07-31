class Groupchat < ApplicationRecord
    belongs_to :member, class_name:"User", foreign_key: "sender_id"
    belongs_to :group
end

class CreateGroupMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :groupchats do |t|
      t.integer :sender_id
      # t.integer :receiver_id
      t.string :text
      t.belongs_to :group

      t.timestamps
    end
  end
end

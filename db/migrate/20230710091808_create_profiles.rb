class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :address
      t.date :dob
      t.string :about
      t.string :bio
      t.belongs_to :user

      t.timestamps
    end
  end
end

class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.attachment :profile_image
      t.string :user_name
      t.string :description
      t.string :twitter_account
      t.references :user, index: true
      t.timestamps
    end
  end
end

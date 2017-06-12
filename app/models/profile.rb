# == Schema Information
#
# Table name: profiles
#
#  id                         :integer          not null, primary key
#  profile_image_file_name    :string
#  profile_image_content_type :string
#  profile_image_file_size    :integer
#  profile_image_updated_at   :datetime
#  user_name                  :string
#  description                :string
#  twitter_account            :string
#  user_id                    :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  image_link                 :string
#
# Indexes
#
#  index_profiles_on_user_id      (user_id)
#

class Profile < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates :user_name, presence: true
  validates :twitter_account, presence: true
  has_attached_file :profile_image, presence: true,
                    default_url: '/system/missing_avatar_profile_:style.jpg'
  validates_attachment_content_type :profile_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end

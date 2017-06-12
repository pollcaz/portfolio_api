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
#  profiles_id                :integer
#  user_id                    :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_profiles_on_profiles_id  (profiles_id)
#  index_profiles_on_user_id      (user_id)
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

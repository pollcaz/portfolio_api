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
FactoryGirl.define do
  factory :profile do
    user_name { Faker::Name.name }
    image_link { Faker::Avatar.image }
    description { Faker::Lorem.paragraph }
    twitter_account { Faker::Twitter.user[:screen_name] }
    association :user, factory: :user
  end
end

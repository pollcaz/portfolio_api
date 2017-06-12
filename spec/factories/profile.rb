FactoryGirl.define do
  factory :profile do
    user_name { Faker::Name.name}
    image_link { Faker::Avatar.image }
    description { Faker::Lorem.paragraph }
    twitter_account { Faker::Twitter.screen_name }
    association :user, :factory => :user
  end
end
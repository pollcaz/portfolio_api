
FactoryGirl.define do
  factory :user, class: User do |_f|
    email { Faker::Internet.email }
    password { '123456' }

    trait :with_profile do
      transient do
        user_name { Faker::Name.name }
        image_link { Faker::Avatar.image }
        description { Faker::Lorem.paragraph }
        twitter_account { Faker::Twitter.user[:screen_name] }
      end

      after :create do |user, e|
        user.build_profile
        user.profile.user_name = e.user_name
        user.profile.image_link = e.image_link
        user.profile.description = e.description
        user.profile.twitter_account = e.twitter_account
        user.save!
      end
    end
  end
end

FactoryBot.define do
  factory :user do
    id { Faker::IDNumber }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    confirmed_at  { Time.zone.now }

    trait :with_comments do
      after(:create) do |user|
        create_list :comment, 3, user: user
      end
    end
  end
end

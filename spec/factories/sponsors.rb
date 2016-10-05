FactoryGirl.define do
  factory :sponsor do
    company { Faker::Company::name }
    description { Faker::Lorem::paragraph }
    url { Faker::Internet::url }
    sponsoring { Faker::Lorem::paragraph }
  end
end

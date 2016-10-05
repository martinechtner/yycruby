FactoryGirl.define do
  factory :sponsor do
    company { Faker::Company::name }
    description { Faker::Lorem::paragraph }
    url { Faker::Internet::url }
    sponsoring { Faker::Lorem::paragraph }
    logo_file_name { Faker::File::name }
    logo_content_type 'image/png'
    logo_file_size 1
    logo_updated_at { Date.today }
  end
end

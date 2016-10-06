FactoryGirl.define do
  factory :job do
    company { Faker::Company::name }
    description { Faker::Lorem::paragraph }
    company_career_url { Faker::Internet::url }
    posting_url { Faker::Internet::url }
    title { Faker::Book::title }
    logo_file_name { Faker::File::name }
    logo_content_type 'image/png'
    logo_file_size 1
    logo_updated_at { Date.today }
  end
end

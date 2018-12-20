FactoryBot.define do
  factory :news do
    content { Faker::Lorem::paragraph }
  end
end

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '33445566' }
  end
end
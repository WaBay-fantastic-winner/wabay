FactoryBot.define do
  factory :project do
    user
    organizer { Faker::Name.name   }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber }
    title { Faker::Food.dish }
    amount_target { Faker::Number.number(digits: 4) }
    end_time { "2022/12/30" }
    description { Faker::Food.description }
  end
end
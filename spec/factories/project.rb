FactoryBot.define do
  factory :project do
    user
    organizer { Faker::Name.name   }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber }
    title { Faker::Food.dish }
    amount_target { Faker::Number.number(digits: 4) }
    end_time { Date.new.end_of_year + 1 }
    description { Faker::Food.description }
  end
end
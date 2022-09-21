FactoryBot.define do
  factory :project do
    user
    organizer { Faker::Name.name   }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber }
    title { Faker::Food.dish }
    amount_target { Faker::Number.number(digits: 4) }
    end_time { Date.new.end_of_year + 1 }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/wubay.png'), 'image/jpg') }
    description { Faker::Food.description }
  end
end
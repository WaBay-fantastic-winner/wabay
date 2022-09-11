FactoryBot.define do
  factory :donate_item do
    project
    title { Faker::Food.dish }
    price { Faker::Number.number(digits: 4) }
    content { Faker::Food.description }
  end
end
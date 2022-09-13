require 'aasm/rspec'

FactoryBot.define do
  factory :transaction do
    user
    donate_item
    serial { Faker::Number.number(digits: 4) }
    price { Faker::Number.number(digits: 4) }
  end
end
FactoryBot.define do
  factory :transaction do
    user { nil }
    donate_item { nil }
    price { 1 }
    pay_status { false }
  end
end

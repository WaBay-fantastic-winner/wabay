FactoryBot.define do
  factory :message do
    content { "MyText" }
    project { nil }
    user { nil }
  end
end

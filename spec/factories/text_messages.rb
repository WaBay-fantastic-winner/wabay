FactoryBot.define do
  factory :text_message do
    content { "MyText" }
    user { nil }
    project { nil }
  end
end

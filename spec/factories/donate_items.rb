FactoryBot.define do
  factory :donate_item do
    title { "MyString" }
    content { "MyText" }
    usesr { nil }
    project { nil }
    count { 1 }
  end
end

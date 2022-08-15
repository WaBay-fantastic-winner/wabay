FactoryBot.define do
  factory :user_rank do
    level { "MyString" }
    condition { "" }
    bonus_feedback { 1 }
    user { nil }
  end
end

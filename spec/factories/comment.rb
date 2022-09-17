FactoryBot.define do
  factory :comment do
    user
    project
    text { Faker::Books::CultureSeries.culture_ship }
  end
end
FactoryBot.define do
  factory :listing do
    user { nil }
    category { nil }
    title { "MyString" }
    description { "MyText" }
    price { "" }
    sold { false }
  end
end

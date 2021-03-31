FactoryBot.define do
  factory :step do
    title { "MyString" }
    content { "MyText" }
    correct_answer { "MyText" }
    exercise { nil }
  end
end

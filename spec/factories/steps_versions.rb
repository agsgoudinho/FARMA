FactoryBot.define do
  factory :steps_version do
    title { "MyString" }
    content { "MyText" }
    correct_answer { "MyText" }
    step { nil }
    exercise_version { nil }
  end
end

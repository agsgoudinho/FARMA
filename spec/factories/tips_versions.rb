FactoryBot.define do
  factory :tips_version do
    content { "MyString" }
    number_of_tries { 1 }
    tip { nil }
    step_version { nil }
  end
end

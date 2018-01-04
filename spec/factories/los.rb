FactoryBot.define do
  factory :lo do
    name        { Faker::StarWars.character }
    description { Faker::StarWars.quote }

    user { create(:user, :actived) }
  end

  factory :invalid_lo, parent: :lo do
    name                  nil
  end
end

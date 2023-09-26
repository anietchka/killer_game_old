FactoryBot.define do
  factory :player do
    name { "MyString" }
    email { "MyString" }
    player_code { 1 }
    status { "MyString" }
    player_type { "MyString" }
    game { nil }
    user { nil }
  end
end

FactoryBot.define do
  factory :kill do
    target_code { 1 }
    executed { false }
    finish_at { "2023-09-26 14:28:30" }
    player { nil }
    mission { nil }
  end
end

FactoryBot.define do
  factory :player do
    name { 'Anna' }
    email { "test@gmail.com" }
    status { 'in_game' }
    player_code { 234 }
    player_type { 'player' }
    association :user, strategy: :build
    association :game, strategy: :build
  end
end

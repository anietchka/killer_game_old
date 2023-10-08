FactoryBot.define do
  factory :game do
    status { 'started' }
    game_type { "auto" }
    name { "Jeu du killer" }
    association :user, strategy: :build
  end
end

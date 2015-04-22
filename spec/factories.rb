FactoryGirl.define do
  factory :player do
    name 'foo'
  end

  factory :match do
    home_goals 2
    away_goals 1
    home_players {[FactoryGirl.create(:player)]}
    away_players {[FactoryGirl.create(:player)]}
  end
end

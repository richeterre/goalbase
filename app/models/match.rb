class Match < ActiveRecord::Base
  has_and_belongs_to_many(:home_players,
    join_table: 'matches_home_players',
    class_name: 'Player'
  )
  has_and_belongs_to_many(:away_players,
    join_table: 'matches_away_players',
    class_name: 'Player'
  )

  validates :home_goals, numericality: {
    greater_than_or_equal_to: 0,
    only_integer: true
  }
  validates :away_goals, numericality: {
    greater_than_or_equal_to: 0,
    only_integer: true
  }
end

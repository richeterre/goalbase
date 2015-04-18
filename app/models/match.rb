class Match < ActiveRecord::Base
  has_and_belongs_to_many(:home_players,
    join_table: 'matches_home_players',
    class_name: 'Player'
  )
  has_and_belongs_to_many(:away_players,
    join_table: 'matches_away_players',
    class_name: 'Player'
  )
end

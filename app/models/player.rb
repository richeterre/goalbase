class Player < ActiveRecord::Base
  has_and_belongs_to_many(:home_matches,
    join_table: 'matches_home_players',
    class_name: 'Match'
  )
  has_and_belongs_to_many(:away_matches,
    join_table: 'matches_away_players',
    class_name: 'Match'
  )

  def rating
    RatingEngine.calculate_rating(self.home_matches, self.away_matches)
  end
end

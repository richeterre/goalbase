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
  validates :home_players, length: { minimum: 1 }
  validates :away_players, length: { minimum: 1 }
  validate :has_distinct_home_and_away_players

  private
    def has_distinct_home_and_away_players
      if home_players.any? && away_players.any? && (home_players & away_players).any?
        errors.add(:match, "cannot have players on both home and away team")
      end
    end
end

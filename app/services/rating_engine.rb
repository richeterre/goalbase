class RatingEngine
  def self.calculate_rating(home_matches, away_matches)
    home_match_count = home_matches.count
    away_match_count = away_matches.count

    max_points = (home_match_count + away_match_count) * 3

    return 0 if max_points == 0

    if home_matches.empty?
      home_points = 0
    else
      home_points = home_matches.map { |match|
        calculate_points(match.home_goals, match.away_goals)
      }.reduce(:+)
    end

    if away_matches.empty?
      away_points = 0
    else
      away_points = away_matches.map { |match|
        calculate_points(match.away_goals, match.home_goals)
      }.reduce(:+)
    end

    return (home_points + away_points) * 10.0 / max_points
  end

  def self.calculate_points(goals_for, goals_against)
    if goals_for > goals_against
      return 3
    elsif goals_for < goals_against
      return 0
    else
      return 1
    end
  end
end

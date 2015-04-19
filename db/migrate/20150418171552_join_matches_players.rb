class JoinMatchesPlayers < ActiveRecord::Migration
  def change
    create_table :matches_home_players, id: false do |t|
      t.uuid :match_id, index: true
      t.uuid :player_id, index: true
    end

    create_table :matches_away_players, id: false do |t|
      t.uuid :match_id, index: true
      t.uuid :player_id, index: true
    end
  end
end

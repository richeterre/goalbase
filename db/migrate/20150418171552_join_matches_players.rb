class JoinMatchesPlayers < ActiveRecord::Migration
  def change
    create_table :matches_home_players, id: false do |t|
      t.references :match, index: true
      t.references :player, index: true
    end

    create_table :matches_away_players, id: false do |t|
      t.references :match, index: true
      t.references :player, index: true
    end
  end
end

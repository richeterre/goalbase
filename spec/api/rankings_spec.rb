require 'rails_helper'

describe API::V1 do
  rankings_path = "/api/v1/rankings"

  describe "GET #{rankings_path}" do
    it "returns an empty array of rankings" do
      get rankings_path
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq []
    end
  end

  context "when a player exists" do
    describe "GET #{rankings_path}" do
      it "returns the ranking for that player" do
        @player = FactoryGirl.create(:player)

        get rankings_path
        expect(response.status).to eq(200)
        expect(response.body).to eq [
          {
            player: {
              id: @player.id,
              name: @player.name
            },
            rating: 0.0
          }
        ].to_json
      end
    end
  end

  context "when several players and matches exist" do
    describe "GET #{rankings_path}" do
      it "returns the player rankings in rating order" do
        @player1 = FactoryGirl.create(:player)
        @player2 = FactoryGirl.create(:player)
        @player3 = FactoryGirl.create(:player)

        match1 = FactoryGirl.create(:match,
          home_players: [@player2],
          away_players: [@player1],
          home_goals: 1,
          away_goals: 0
        )
        match2 = FactoryGirl.create(:match,
          home_players: [@player2],
          away_players: [@player3],
          home_goals: 0,
          away_goals: 0
        )

        get rankings_path
        expect(response.body).to eq [
          {
            player: {
              id: @player2.id,
              name: @player2.name
            },
            rating: 6.667
          },
          {
            player: {
              id: @player3.id,
              name: @player3.name
            },
            rating: 3.333
          },
          {
            player: {
              id: @player1.id,
              name: @player1.name
            },
            rating: 0.0
          }
        ].to_json
      end
    end
  end
end

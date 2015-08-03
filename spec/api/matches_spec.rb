require 'rails_helper'

describe API::V1 do
  matches_path = "/api/v1/matches"

  describe "GET #{matches_path}" do
    it "returns an empty array of matches" do
      get matches_path
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq []
    end
  end

  context "when a match exists" do
    describe "GET #{matches_path}" do
      it "returns the match" do
        @match = FactoryGirl.create(:match)
        @home_player = @match.home_players[0]
        @away_player = @match.away_players[0]

        get matches_path
        expect(response.status).to eq(200)
        expect(response.body).to eq [
          {
            id: @match.id,
            home_goals: @match.home_goals,
            away_goals: @match.away_goals,
            home_players: [
              id: @home_player.id,
              name: @home_player.name
            ],
            away_players: [
              id: @away_player.id,
              name: @away_player.name
            ]
          }
        ].to_json
      end
    end
  end

  context "when several matches exist" do
    describe "GET #{matches_path}" do
      it "returns the matches in descending order of creation" do
        @match1 = FactoryGirl.create(:match, home_goals: 1, away_goals: 0)
        @match2 = FactoryGirl.create(:match, home_goals: 0, away_goals: 1)

        get matches_path
        expect(response.status).to eq(200)
        expect(response.body).to eq [
          {
            id: @match2.id,
            home_goals: @match2.home_goals,
            away_goals: @match2.away_goals,
            home_players: [
              id: @match2.home_players[0].id,
              name: @match2.home_players[0].name
            ],
            away_players: [
              id: @match2.away_players[0].id,
              name: @match2.away_players[0].name
            ]
          },
          {
            id: @match1.id,
            home_goals: @match1.home_goals,
            away_goals: @match1.away_goals,
            home_players: [
              id: @match1.home_players[0].id,
              name: @match1.home_players[0].name
            ],
            away_players: [
              id: @match1.away_players[0].id,
              name: @match1.away_players[0].name
            ]
          }
        ].to_json
      end
    end
  end

  context "with valid attributes" do
    before (:each) do
      @match = FactoryGirl.create(:match)
      @match_params = {
        home_goals: @match.home_goals,
        away_goals: @match.away_goals,
        home_player_ids: @match.home_players.map(&:id),
        away_player_ids: @match.away_players.map(&:id)
      }
    end

    it "creates a new match" do
      expect {
        post matches_path, @match_params
      }.to change(Match, :count).by(1)
    end

    it "has the right response status code when creating a new match" do
      post matches_path, @match_params
      expect(response.status).to eq(201)
    end

    it "updates an existing match" do
      @updated_match_params = {
        home_goals: 1,
        away_goals: 2,
        home_player_ids: @match.away_players.map(&:id),
        away_player_ids: @match.home_players.map(&:id)
      }

      put "#{matches_path}/#{@match.id}", @updated_match_params
      expect(response.status).to eq(200)
    end
  end

  it "deletes an existing match" do
    @match = FactoryGirl.create(:match)

    expect {
      delete "#{matches_path}/#{@match.id}"
    }.to change(Match, :count).by(-1)
  end
end

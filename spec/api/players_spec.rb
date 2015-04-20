require 'rails_helper'

describe API::V1 do
  players_path = "/api/v1/players"
  describe "GET #{players_path}" do
    it "returns an empty array of players" do
      get players_path
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq []
    end
  end

  context "when a player exists" do
    describe "GET #{players_path}" do
      it "returns the player" do
        @player = FactoryGirl.create(:player)

        get players_path
        expect(response.status).to eq(200)
        expect(response.body).to eq [
          {
            id: @player.id,
            name: @player.name
          }
        ].to_json
      end
    end
  end
end

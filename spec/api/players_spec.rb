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

  context "with valid attributes" do
    it "creates a new player" do
      expect {
        post players_path, FactoryGirl.attributes_for(:player)
      }.to change(Player, :count).by(1)
    end

    it "has the right response status code when creating a new player" do
      post players_path, FactoryGirl.attributes_for(:player)
      expect(response.status).to eq(201)
    end
  end
end

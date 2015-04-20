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
end

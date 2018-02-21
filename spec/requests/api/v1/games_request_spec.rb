require 'rails_helper'

describe "Games API" do
  context "GET requests" do
    it "can show JSON response for one game" do
      game = create(:game)
      get "/api/v1/games/#{game.id}"

      expect(response).to be_success
      game_score = JSON.parse(response.body)
      expect(game_score).to be_a Hash
      expect(game_score["game_id"]).to eq game.id
    end

  end

  context "POST requests" do

  end
end

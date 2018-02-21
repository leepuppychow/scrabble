require 'rails_helper'

describe "Games API" do
  context "GET requests" do
    before :each do
      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      @game = Game.create(player_1: josh, player_2: sal)

      josh.plays.create(game: @game, word: "sal", score: 3)
      josh.plays.create(game: @game, word: "zoo", score: 12)
      sal.plays.create(game: @game, word: "josh", score: 14)
      sal.plays.create(game: @game, word: "no", score: 2)
    end

    it "can show JSON response for one game" do
      get "/api/v1/games/#{@game.id}"

      expect(response).to be_success
      game_score = JSON.parse(response.body)
      expect(game_score).to be_a Hash
      expect(game_score["game_id"]).to eq game.id
    end

  end

  context "POST requests" do

  end
end

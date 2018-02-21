require 'rails_helper'

describe "Games API" do
  before :each do
    @josh = User.create(id: 1, name: "Josh")
    @sal = User.create(id: 2, name: "Sal")

    @game = Game.create(player_1: @josh, player_2: @sal)

    @josh.plays.create(game: @game, word: "sal", score: 3)
    @josh.plays.create(game: @game, word: "zoo", score: 12)
    @sal.plays.create(game: @game, word: "josh", score: 14)
    @sal.plays.create(game: @game, word: "no", score: 2)
  end

  it "(GET) can show JSON response for one game" do
    get "/api/v1/games/#{@game.id}"

    expect(response).to be_success
    game_score = JSON.parse(response.body)
    expect(game_score).to be_a Hash
    expect(game_score["game_id"]).to eq @game.id
    expect(game_score["scores"]).to be_a Array
    expect(game_score["scores"].first["user_id"]).to eq @josh.id
    expect(game_score["scores"].second["user_id"]).to eq @sal.id
    expect(game_score["scores"].first["score"]).to eq 15
    expect(game_score["scores"].second["score"]).to eq 16
  end


  it "(POST) can send a user_id and word through the params to update a game" do
    game_params = {user_id: 1, word: "at"}

    post "/api/v1/games/#{@game.id}", params: game_params

    expect(response).to be_success

    game_score = JSON.parse(response.body)
    expect(game_score).to be_a Hash
    expect(game_score["game_id"]).to eq @game.id
    expect(game_score["scores"]).to be_a Array
    expect(game_score["scores"].first["user_id"]).to eq @josh.id
    expect(game_score["scores"].second["user_id"]).to eq @sal.id
    expect(game_score["scores"].first["score"]).to eq 17
    expect(game_score["scores"].second["score"]).to eq 16
  end

end

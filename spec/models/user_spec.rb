require 'rails_helper'

describe User do
  context "Instance Methods" do
    it "#total_score gives the total score for all plays from user" do
      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      game = Game.create(player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)

      expect(josh.total_score).to eq 15
      expect(sal.total_score).to eq 16
    end
  end

end

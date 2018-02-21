class Api::V1::GamesController < ApiController

  def show
    render json: current_game
  end

  def create
    player = User.find(params[:user_id])
    word = params[:word]
    new_play = Play.create!(user_id: player.id, game_id: current_game.id, word: word)

    render json: current_game
  end

  private

    def current_game
      Game.find(params[:id])
    end

end

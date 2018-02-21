class Api::V1::GamesController < ApiController

  def show
    render json: current_game
  end

  def create
    if valid_word?(params[:word])
      Play.create!(user_id: current_player.id,
                    game_id: current_game.id,
                    word: params[:word])
      render json: current_game
    else
      render json: {"message": "#{params[:word]} is not a valid word."}
    end
  end

  private

    def current_game
      Game.find(params[:id])
    end

    def current_player
      User.find(params[:user_id])
    end

    def valid_word?(word)
      validate = ValidateWordService.new(word)
      return true if validate.status_code == 200 
    end

end

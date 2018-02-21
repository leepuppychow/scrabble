class Api::V1::GamesController < ApiController

  def show
    render json: Game.find(params[:id])
  end

end

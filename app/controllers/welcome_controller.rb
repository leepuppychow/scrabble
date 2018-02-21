class WelcomeController < ApplicationController

  def index
  end

  def create
    @word = params[:word]
    validate = ValidateWordService.new(@word)

    if validate.status_code == 200
      @root = validate.root
      render :valid
    elsif validate.status_code == 404
      render :invalid
    end
  end

end

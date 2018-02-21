class WelcomeController < ApplicationController

  def index

  end

  def create
    @word = params[:word]

    @connection = Faraday.new("https://od-api.oxforddictionaries.com/api/v1") do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.headers["Accept"] = "application/json"
      faraday.headers['app_id'] = ENV['OXFORD_APP_ID']
      faraday.headers['app_key'] = ENV['OXFORD_APP_KEY']
    end

    response = @connection.get("inflections/en/#{@word}")

    if response.status == 200
      body = JSON.parse(response.body, symbolize_names: true)
      @root = body[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]
      render :index
    elsif response.status == 404
      render :invalid
    end
  end
end

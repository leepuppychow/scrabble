class WelcomeController < ApplicationController
  def index
    @connection = Faraday.new("https://od-api.oxforddictionaries.com/api/v1") do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.headers["Accept"] = "application/json"
      faraday.headers['app_id'] = ENV['OXFORD_APP_ID']
      faraday.headers['app_key'] = ENV['OXFORD_APP_KEY']
    end

    response = @connection.get('entries/en/ace')
    body = JSON.parse(response.body, symbolize_names: true)
  end
end

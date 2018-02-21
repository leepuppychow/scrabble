class ValidateWordService

  def initialize(word)
    @word = word
  end

  def status_code
    response.status
  end

  def root
    body[:results].first[:lexicalEntries].first[:inflectionOf].first[:id]
  end

  private

    def connection
      Faraday.new("https://od-api.oxforddictionaries.com/api/v1") do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
        faraday.headers["Accept"] = "application/json"
        faraday.headers['app_id'] = ENV['OXFORD_APP_ID']
        faraday.headers['app_key'] = ENV['OXFORD_APP_KEY']
      end
    end

    def response
      connection.get("inflections/en/#{@word}")
    end

    def body
      JSON.parse(response.body, symbolize_names: true)
    end

end

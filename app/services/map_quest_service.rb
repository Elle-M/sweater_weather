class MapQuestService
  def self.geocode(location)
    response = conn.get("/geocoding/v1/address") do |req|
      req.params[:key] = ENV['MAP_QUEST_API_KEY']
      req.params[:location] = location
    end
    parse_data(response)[:results][0][:locations][0][:latLng]
    # require 'pry'; binding.pry
  end

  def self.get_coordinates(location)
    # require 'pry'; binding.pry
    geocode(location)
  end

  private

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com")
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
class ParkService 
  def self.search(state)
    conn = Faraday.new("https://developer.nps.gov/api/v1/") do |faraday|
      faraday.params["api_key"] = ENV["parks_api"]
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("parks?stateCode=#{state}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
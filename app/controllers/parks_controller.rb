class ParksController < ApplicationController 


  def index 
    conn = Faraday.new("https://developer.nps.gov/api/v1/") do |faraday|
      faraday.params["api_key"] = ENV["parks_api"]
    end
    response = conn.get("parks?stateCode=#{params[:state]}")
    state_parks = JSON.parse(response.body, symbolize_names: true)
    @parks = state_parks[:data]
    # @parks[:data][0][:fullName]
  end
end
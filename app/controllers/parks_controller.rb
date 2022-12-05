class ParksController < ApplicationController 


  def index 
    @parks = ParkFacade.park_list(params[:state]) 
    # require 'pry'; binding.pry

    # conn = Faraday.new("https://developer.nps.gov/api/v1/") do |faraday|
    #   faraday.params["api_key"] = ENV["parks_api"]
    # end
    # response = conn.get("parks?stateCode=#{params[:state]}")
    # json = JSON.parse(response.body, symbolize_names: true)
    # @parks = json[:data].map do |data|
    #   Park.new(data)
    # end
    # require 'pry'; binding.pry
  end
end
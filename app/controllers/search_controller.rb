class SearchController < ApplicationController
  def index
    @stations = get_json(params).map do |raw_station|
      Station.new(raw_station)
    end
  end


  private

    def conn(params)
      Faraday.new(:url => "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json", :params => params)
    end

    def get_json(params)
      response = conn(params).get
      JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
    end
end

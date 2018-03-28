class SearchController < ApplicationController
  def index
    @stations = get_json.map do |raw_station|
      Station.new(raw_station)
    end
  end


  private

    def conn
      Faraday.new(:url => "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json", :params => params)
    end

    def get_json
      response = conn.get
      JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
    end

    def params
      {
        :api_key => ENV['NREL_API_KEY'],
        :fuel_type => "ELEC,LPG",
        :distance => "6",
        :location => "80203",
        :limit => "10"
      }
    end

end

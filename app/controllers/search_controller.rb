class SearchController < ApplicationController
  def index
    @stations = FuelService.new(params).run
  end
end

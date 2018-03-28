class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times
  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @fuel_types = attributes[:fuel_types]
    @distance = attributes[:distance]
    @access_times = attributes[:access_times]
  end
end

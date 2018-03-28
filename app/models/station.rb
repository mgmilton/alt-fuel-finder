class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times
  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:street_address]
    @fuel_types = attributes[:fuel_type_codes]
    @distance = attributes[:distance]
    @access_times = attributes[:access_days_time]
  end
end

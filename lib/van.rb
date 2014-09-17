require_relative 'bike_container'
require_relative 'docking_station'

include BikeContainer

class Van
	def initialize(options = {})
  	  self.capacity = options.fetch(:capacity, capacity)
    end

    def release_to_garage
      bikes.delete(broken_bikes.pop)
    end

    def accept_from_station(station)
    bikes << station.release_to_van until station.broken_bikes.empty?
    raise "The van is full!" if full?
    end

end
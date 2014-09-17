require_relative 'bike_container'
require_relative 'docking_station'

include BikeContainer

class Van

	def initialize(options = {})
  	  self.capacity = options.fetch(:capacity, capacity)
    end

    def release_broken_bikes
      bikes.delete(broken_bikes.pop)
    end

    def accept_from_station(station)
      bikes << station.release_broken_bikes until station.broken_bikes.empty?
      raise "The van is full!" if full?
    end

end
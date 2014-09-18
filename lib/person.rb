require_relative 'bike'
require_relative 'docking_station'

class Person

	def initialize(bike=nil)
		@bike = bike
	end

	def has_bike?
		@bike != nil
	end

	def rent_a_bike(station)
        @bike = station.release
	end

end
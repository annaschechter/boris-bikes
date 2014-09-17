require_relative 'bike_container'

include BikeContainer

class Van
	def initialize(options = {})
  	  self.capacity = options.fetch(:capacity, capacity)
    end

    def release_broken_bikes
      bikes.delete(broken_bikes.pop)
    end

end
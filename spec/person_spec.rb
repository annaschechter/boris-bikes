require 'person'

describe Person do 

	let(:person) {Person.new}
	let(:station) {DockingStation.new}
	let(:bike) {Bike.new}
	
	it "should not possess a bike" do
	   expect(person).not_to have_bike
	end

	it "should be able to rent a bike" do
		station.dock(bike)
		person.rent_a_bike(station)
		expect(person).to have_bike
	end


end
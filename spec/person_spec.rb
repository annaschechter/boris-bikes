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

	it "should be able to return a bike" do
		station.dock(bike)
		person.rent_a_bike(station)
		person.return_bike(station)
		expect(person).to_not have_bike
	end

	it "should be able to fall down and break a bike" do
        station.dock(bike)
		person.rent_a_bike(station)
		person.crash(bike)
		expect(bike).to be_broken
	end


end
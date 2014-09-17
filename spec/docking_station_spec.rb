require "docking_station"

describe DockingStation do 

let(:station) { DockingStation.new(:capacity => 123) }

it "should allow setting default capacity on initialising" do
  expect(station.capacity).to eq(123)
end


it "should know when there are no bikes" do
	expect(station.bike_count).to eq(0)
	expect(station).to be_empty
end

it "should know when there are no bikes available" do
	expect(available_bikes).to be_empty
	expect(station).not_to have_rentals
end

it "should release broken bikes to the van" do
	expect(station).to be_empty
	broken_bike = Bike.new
	broken_bike.break!
	station.dock(broken_bike)
	station.release_to_van
	expect(station).to be_empty
end

end
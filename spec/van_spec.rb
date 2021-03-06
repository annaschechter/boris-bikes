require 'van'
require 'garage'

describe Van do
	
  let(:van) { Van.new(:capacity => 123) }
  let(:station) { DockingStation.new(:capacity => 20)}
  let(:bike) {Bike.new}
  let(:garage){Garage.new(:capacity =>20)}


  it "should allow setting default capacity on initialising" do
    expect(van.capacity).to eq(123)
  end	

  it "should release broken bikes to the garage" do
    expect(van.bike_count).to eq(0)
    broken_bike = Bike.new
    broken_bike.break!
    van.dock(broken_bike)
    van.release_broken_bikes
    expect(van.bike_count).to eq(0)
  end

  it "should release working bikes to the docking station" do
  	expect(station).to be_empty
  	van.dock(bike)
  	expect(van.broken_bikes).to be_empty
  	van.release
  	station.dock(bike)
  	expect(van.bike_count).to eq(0)
  	expect(station.bike_count).to eq(1)
  end
   it "should accept broken bikes from the station" do
   	broken_bike = Bike.new
   	broken_bike.break!
   	station.dock(broken_bike)
   	expect(van.bike_count).to eq(0)
   	van.accept_from_station(station)
   	expect(van.bike_count).to eq(1)
   end

   it "should accept working bikes from the garage" do
   	expect(van.bike_count).to eq(0)
    bike1, bike2 = Bike.new, Bike.new
    garage.dock(bike1)
    garage.dock(bike2)
   	van.accept_fixed_bikes(garage)
   	expect(van.bike_count).to eq(2)
   end



  	
end
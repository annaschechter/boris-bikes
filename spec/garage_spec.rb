require 'garage'
require 'bike'

describe Garage do
	
  let(:van) { Van.new(:capacity => 123) }
  let(:bike) {Bike.new}
  let(:garage) {Garage.new(:capacity => 20)}

  it "should allow setting default capacity on initialising" do
    expect(garage.capacity).to eq(20)
  end	

  it "should accept broken bikes from the van" do
     expect(garage.bike_count).to eq(0)
     broken_bike1, broken_bike2 = Bike.new, Bike.new
     broken_bike1.break!
     broken_bike2.break!
     van.dock(broken_bike1)
     van.dock(broken_bike2)
     garage.accept_broken_bikes(van)
     expect(garage.bike_count).to eq(2)
    end

    it "should fix broken bikes" do
     expect(garage.bike_count).to eq(0)
     broken_bike1 = Bike.new
     van.dock(broken_bike1)
     broken_bike1.break!
     garage.accept_broken_bikes(van)
     expect(garage.broken_bikes.count).to eq(0)
     expect(garage.available_bikes.count).to eq(1)
 end
     

end
require 'garage'

describe Garage do
	
  let(:van) { Van.new(:capacity => 123) }
  let(:station) { DockingStation.new(:capacity => 20)}
  let(:bike) {Bike.new}
  let(:garage) {Garage.new(:capacity => 20)}

  it "should allow setting default capacity on initialising" do
    expect(garage.capacity).to eq(20)
  end	

end
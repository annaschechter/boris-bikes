require 'van'

describe Van do
	
  let(:van) { Van.new(:capacity => 123) }

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
end
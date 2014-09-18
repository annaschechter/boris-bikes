require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) {Bike.new}
	let(:holder) {ContainerHolder.new}

	def fill_holder
		10.times {holder.dock(bike)}
	end

	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release
		expect(holder.bike_count).to eq(0)
	end

    it "should know when it's full" do
    	expect(holder).not_to be_full
    	10.times {holder.dock(bike)}
    	expect(holder).to be_full
    end

    it "should not accept a bike if it's full" do
    	fill_holder
    	expect(lambda {holder.dock(bike)}).to raise_error(RuntimeError)
    end

    it "should know what bikes are available" do
    	working_bike, broken_bike = Bike.new, Bike.new
    	broken_bike.break!
    	holder.dock(working_bike)
    	holder.dock(broken_bike)
    	expect(holder.available_bikes).to eq([working_bike])
    end
    
    it "should release a bike only if it is not empty" do
    	expect(holder.bike_count).to eq(0)
    	expect(lambda {holder.release}).to raise_error(RuntimeError)
    end

    it "should release a bike even if bike = empty" do
        expect(holder.bike_count).to eq(0)
        holder.dock(bike)
        holder.release
        expect(holder.bike_count).to eq(0)
    end


    it "should dock a bike even if bike = empty" do
        expect(lambda {holder.dock(:b)}).to raise_error(RuntimeError)
    end
    
    it "should know what bikes are broken" do
        working_bike, broken_bike = Bike.new, Bike.new
        broken_bike.break!
        holder.dock(working_bike)
        holder.dock(broken_bike)
        expect(holder.broken_bikes).to eq([broken_bike])
    end

    it "should not accept anything but positive integers for capacity" do
        holder.capacity = "-2"
        expect(holder.capacity).to eq(10)
    end

end
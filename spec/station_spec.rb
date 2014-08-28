require 'spec_helper'

describe Station do 
	it 'should initialize with a name' do 
		station = Station.new({:name =>'Alewife'})
		expect(station).to be_an_instance_of Station
	end

	it 'should display the station name' do
		station = Station.new({:name =>'Alewife'})
		expect(station.name).to eq 'Alewife'
	end

	it 'should start with no train stations' do
		station = Station.new({:name =>'Alewife'})
		expect(Station.all).to eq []
	end

	it 'should save train stations to the database' do
		station = Station.new({:name =>'Alewife'})
		station.save
		expect(Station.all).to eq [station]
	end

	it 'is the same station if it has the same name' do
		station1 = Station.new({:name =>'Alewife'})
		station2 = Station.new({:name =>'Alewife'})
		expect(station1).to eq station2
	end

	it 'should allow a staion to have many train lines' do 
		station = Station.new({:name => 'Alewife'})
		station.save
		line = Line.new({:name => 'Green'})
		line.save
		line1 = Line.new({:name => 'Blue'})
		line1.save
		Station.stops(line.id, station.id)
		Station.stops(line1.id, station.id)
		lines = Line.lines_to_station(station.id)
		expect(lines).to eq [line, line1]
	end
end
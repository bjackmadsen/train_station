require 'station'
require 'rspec'

describe Station do 
	it 'should initialize with a name' do 
		station = Station.new('Alewife')
		expect(station).to be_an_instance_of Station
	end

	it 'should display the station name' do
		station = Station.new('Alewife')
		expect(station.name).to eq 'Alewife'
	end

	it 'should start with no train stations' do
		station = Station.new('Alewife')
		expect(Station.all).to eq []
	end
end
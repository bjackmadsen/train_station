require 'station'
require 'rspec'

describe Station do 
	'it should initialize with a name' do 
		station = Station.new('Alewife')
		expect(station).to be_an_instance_of Station
	end
end
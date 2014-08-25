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
end
require 'station'
require 'rspec'
require 'pg'

DB = PG.connect({:dbname => 'trainstation_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM station *;")
    end
end

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

	it 'should save train stations to the database' do
		station = Station.new('Alewife')
		station.save
		expect(Station.all).to eq [station]
	end
end
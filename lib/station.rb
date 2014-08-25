require 'pg'

class Station
	
	attr_reader(:name)
	
	def initialize(attributes)
		@name = attributes[:name]
	end

	def self.all
		stations = []
		results = DB.exec("SELECT * FROM station;")
		results.each do |result|
			name = result ['name']
			stations << Station.new({:name => 'Alewife'})
		end
		stations
	end

	def save
		DB.exec("INSERT INTO station (name) VALUES ('#{@name}');")
	end

	def ==(another_station)
    	self.name == another_station.name
    end
end
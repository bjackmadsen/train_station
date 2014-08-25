require 'pg'

class Station
	
	attr_reader(:id, :name)
	
	def initialize(attributes)
		@name = attributes[:name]
		@id = attributes[:id]
	end

	def self.all
		stations = []
		results = DB.exec("SELECT * FROM station;")
		results.each do |result|
			name = result ['name']
			id = result ['id'].to_i
			stations << Station.new({:id => 2, :name => 'Alewife'})
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
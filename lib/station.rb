require 'pg'

class Station
	def initialize(name)
		@name = name
	end

	def name
		@name
	end

	def self.all
		stations = []
		database = PG.connect({:dbname => 'trainstation_test'})
		results = database.exec("SELECT * FROM station;")
		results.each do |result|
			name = result ['name']
			stations << Station.new(name)
		end
		stations
	end

	def save
		database = PG.connect({:dbname => 'trainstation_test'})
		database.exec("INSERT INTO station (name) VALUES ('#{@name}');")
	end
end
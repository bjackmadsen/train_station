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
			stations << Station.new({:id => id, :name => name})
		end
		stations
	end

	def save
		results = DB.exec("INSERT INTO station (name) VALUES ('#{name}') RETURNING id;")
		@id = results.first['id'].to_i
	end

	def ==(another_station)
    	self.name == another_station.name && self.id == another_station.id
    end

    def self.stations_to_lines(line_id)
		results = DB.exec("SELECT station. * FROM line JOIN stops ON (line.id = stops.line_id) JOIN station ON (stops.station_id = station.id) WHERE line_id = #{line_id};")
		stations = []
		results.each do |result|
			name = result['name']
			id = result['id'].to_i
			stations << Station.new({:name => name, :id => id})
		end
	stations
	end
end
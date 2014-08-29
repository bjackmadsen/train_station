require 'pg'

class Line

	attr_reader(:id, :name)

	def initialize(attributes)
		@name = attributes[:name]
		@id = attributes[:id]
	end


	def self.all
		lines = []
		results = DB.exec("SELECT * FROM line;")
		results.each do |result|
			name = result ['name']
			id = result ['id'].to_i
			lines << Line.new({:id => id, :name => name})
		end
		lines
	end

	def self.find(line_name)
		results = DB.exec("SELECT * FROM line WHERE name = '#{line_name}';")
		line_id = results.first[:id]
	end
	
	def self.delete(input_line)
    	Line.all.each do |line|
      	if input_line == line.name
        DB.exec("DELETE FROM line WHERE name = '#{input_line}';")
      	end
      end
  	end

	def save
		results = DB.exec("INSERT INTO line (name) VALUES ('#{@name}') RETURNING id;")
		@id = results.first['id'].to_i
	end

	def ==(another_line)
    	self.name == another_line.name && self.id == another_line.id
    end	

    def self.stops(line_id, station_id)
		results = DB.exec("INSERT INTO stops (line_id, station_id) VALUES (#{line_id}, #{station_id}) RETURNING id;")
		@id = results.first['id'].to_i
	end

	def self.lines_to_station(station_id)
    	lines = []
    	results = DB.exec("SELECT line. * FROM station JOIN stops ON (station.id = stops.station_id) JOIN line ON (stops.line_id = line.id) WHERE station_id = #{station_id};")
    	results.each do |result|
    		name = result ['name']
    		id = result ['id'].to_i
    		lines << Line.new({:id => id, :name => name})
    	end
    	lines 
    end
end
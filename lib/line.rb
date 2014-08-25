require 'pg'

class Line
	def initialize(name)
		@name = name
	end

	def name
		@name
	end

	def self.all
		lines = []
		results = DB.exec("SELECT * FROM line;")
		results.each do |result|
			name = result ['name']
			lines << Line.new(name)
		end
		lines
	end

	def save
		DB.exec("INSERT INTO line (name) VALUES ('#{@name}');")
	end

	def ==(another_line)
    	self.name == another_line.name
    end
end
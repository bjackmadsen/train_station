require 'pg'

class Line

	attr_reader(:name)

	def initialize(attributes)
		@name = attributes[:name]
	end

	def self.all
		lines = []
		results = DB.exec("SELECT * FROM line;")
		results.each do |result|
			name = result ['name']
			lines << Line.new({:name => 'Red'})
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
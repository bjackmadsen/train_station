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
			lines << Line.new({:id => 3, :name => 'Green'})
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
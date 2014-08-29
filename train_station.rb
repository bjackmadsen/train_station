require './lib/line'
require './lib/station'
require 'pg'
require 'pry'

DB = PG.connect(:dbname => 'train_system')

def welcome
	system('clear')
	puts "*** WELCOME TO THE OREGON TRANSIT AUTHORITY ***"
	puts "Type [1] if you are a train operator."
	puts "Type [2] if you are a train passenger."
	puts "Type [x] if you would like to exit the program."
	user_choice = gets.chomp
	if user_choice == '1'
		operator_menu
	elsif user_choice == '2'
		passenger_menu
	elsif user_choice == 'x'
		puts "Thank you, have a nice day!"
		exit
	else
		puts "Sorry, that wasn't a valid option."
		sleep(1.0)
		welcome 
	end
end

def operator_menu
	system('clear')
	puts "*** OPERATOR MENU ***"
	puts "Type [a] to add a train station."
	puts "Type [b] to add a train line."
	puts "Type [c] to list all train stations."
	puts "Type [d] to list all train lines."
	puts "Type [e] to view the station stops for a train line."
	puts "To return to the main menu please type [m]"
	user_choice = gets.chomp
	if user_choice == 'a'
		add_station
	elsif user_choice == 'b'
		add_line
	elsif user_choice == 'c'
		list_stations
	elsif user_choice == 'd'
		list_lines
	elsif user_choice == 'e'
		track_lines
	elsif user_choice == 'm'
		welcome 
	else
		puts "Sorry, that wasn't a valid option."
		sleep(1.0)
		operator_menu
	end
end

def passenger_menu
	system('clear')
	puts "*** PASSENGER MENU ***"
	puts "Type [1] to view the stops along a train line."
	puts "Type [2] to view a station location and the lines that stop there."
	puts "To return to the maine menu please type [m]"
	user_choice = gets.chomp
	if user_choice == '1'
		list_lines
	elsif user_choice == '2'
		list_stations
	elsif user_choice == 'm'
		welcome
	else
		puts "Sorry, that wasn't a valid option."
		sleep(1.0)
		passenger_menu	
	end	
end

def add_station
	system('clear')
	puts "*** ADD A TRAIN STATION ***"
	puts "Please type the station name:"
	station_name = gets.chomp
	new_station = Station.new({:name => station_name})
	new_station.save
	puts "\n"
	puts "'#{new_station.name}' has been added!"
	sleep(1.0)
	operator_menu
end

def delete_station
	puts "Which station would you like to remove"
  	input_station = gets.chomp
  	Station.delete(input_station)
  	puts "Station removed"
  	sleep(0.5)
  	list_stations
end

def delete_line
	puts "Which line would you like to remove"
  	input_line = gets.chomp
  	Line.delete(input_line)
  	puts "Line removed"
  	sleep(0.5)
  	list_lines
end

def list_stations
	system('clear')
	puts "*** TRAIN STATIONS ***"
	Station.all.each do |station|
		puts "#{station.name}"
	end
	puts "\n"
	puts "Type [1] to delete a station."
	puts "Type [2] to return to the operator menu."
	puts "Type [3] to return to the main menu."
	user_choice = gets.chomp
	if user_choice == '1'
		delete_station
	elsif user_choice == '2'
		operator_menu
	elsif user_choice == '3'
		welcome
	else 
		puts "Sorry, that wasn't a valid option."
		sleep(1.0)
		list_stations
	end	
end

def list_lines
	system('clear')
	puts "*** TRAIN LINES ***"
	Line.all.each do |line|
		puts "#{line.name}"
	end
	puts "\n"
	puts "Type [1] to delete a line."
	puts "Type [2] to return to the operator menu."
	puts "Type [3] to return to the main menu."
	user_choice = gets.chomp
	if user_choice == '1'
		delete_line
	elsif user_choice == '2'
		operator_menu
	elsif user_choice == '3'
		welcome
	else 
		puts "Sorry, that wasn't a valid option."
		sleep(1.0)
		list_lines
	end	
end

def add_line
	system('clear')
	puts "*** ADD A TRAIN LINE ***"
	puts "Please type the train line name:"
	line_name = gets.chomp
	new_line = Line.new({:name => line_name})
	new_line.save
	puts "\n"
	puts "'#{new_line.name}' has been added!"
	line_stop
end	

def line_stop
	system('clear')
	puts "*** ADD A TRAIN STOP ***"
	sleep(0.5)
	puts "Select a train line from the list below and press enter."
	puts "\n"
	Line.all.each do |line|
		puts "#{line.name}"
	end
	puts "\n"
	line_name = gets.chomp
	line_id = Line.find(line_name)
	puts "\n"
	puts "Now select a stop for this line:"
	puts "\n"
	Station.all.each do |station|
		puts "#{station.name}"
	end
	puts "\n"
	station_name = gets.chomp
	station_id = Station.find(station_name)
	new_stop = Station.stops(line_id, station_id)
	new_stop
	puts "You have assigned the '#{line_name}' line to stop at '#{station_name}' Station!"
	puts "\n"
	puts "Type [1] to add another stop."
	puts "Type [2] to return to the operator menu."
	user_choice = gets.chomp
	if user_choice == '1'
		line_stop
	elsif user_choice == '2'
		operator_menu
	else 
		puts "Sorry, that wasn't a valid option."
		sleep(1.0)
		add_stop
	end	
end 			
welcome
		

require './lib/line'
require './lib/station'
require 'pg'

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
		welcome 
	end
end
			
welcome
		

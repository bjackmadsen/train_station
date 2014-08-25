require 'spec_helper'

describe Line do 
	it 'should initialize with a name' do 
		line = Line.new({:name =>'Red'})
		expect(line).to be_an_instance_of Line
	end

	it 'should display the line name' do
		line = Line.new({:name =>'Red'})
		expect(line.name).to eq 'Red'
	end

	it 'should start with no train lines' do
		line = Line.new({:name =>'Red'})
		expect(Line.all).to eq []
	end

	it 'should save train lines to the database' do
		line = Line.new({:name =>'Red'})
		line.save
		expect(Line.all).to eq [line]
	end

	it 'is the same line if it has the same name' do
		line1 = Line.new({:name =>'Red'})
		line2 = Line.new({:name =>'Red'})
		expect(line1).to eq line2
	end
end
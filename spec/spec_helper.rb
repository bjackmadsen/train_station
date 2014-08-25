require 'station'
require 'line'
require 'rspec'
require 'pg'

DB = PG.connect({:dbname => 'trainstation_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM station *;")
    DB.exec("DELETE FROM line *;")
    end
end
require('rspec')
require('train')
require('city')
require('pry')
require('pg')


DB = PG.connect({:dbname => "train_system_test"})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM trains *;")
    DB.exec("DELETE FROM cities*;")
  end

end

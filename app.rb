require("sinatra")
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/train')
require('./lib/city')
require('pg')

DB = PG.connect({:dbname => "train_system_test"})

get('/') do
   erb(:index)
end

get('/trains/new') do
  erb(:trains_new)
end

post('/trains/new') do
  name = params.fetch('name')
  city = params.fetch('city')
  train = Train.new({:name => name, :id => nil})
  train.save()
  erb(:success)
end

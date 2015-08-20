require("sinatra")
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/train')
require('./lib/city')
require('pg')

DB = PG.connect({:dbname => "train_system_test"})

get('/') do
  @trains = Train.all()
   erb(:index)
end

get('/trains/new') do
  erb(:trains_new)
end

post('/trains/new') do
  name = params.fetch('name')
  train = Train.new({:name => name, :id => nil})
  train.save()
  erb(:success)
end

get('/trains/:id') do
  @train = Train.find(params.fetch('id').to_i())
  erb(:train_specific)
end

patch('/trains/:id') do
  name = params.fetch("name")
  @train = Train.find(params.fetch('id').to_i())
  @train.update({:name => name})
  erb(:train_specific)
end

delete('/trains/:id') do
  @train = Train.find(params.fetch('id').to_i())
  @train.delete()
  @trains = Train.all()
  erb(:index)
end

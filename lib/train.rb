require('pry')

class Train
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    returned_trains.each() do |train|
        name = train.fetch('name')
        id = train.fetch('id').to_i()
        trains.push(Train.new({:name => name, :id => id}))
    end
    trains
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:==) do |another_train|
    self.name().==(another_train.name())
  end

  define_singleton_method(:find) do |id|
    all_trains = Train.all()
    found_train = nil
    all_trains.each() do |train|
      if train.id().==(id)
        found_train = train
      end
    end
    found_train
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{@id};")
  end


end

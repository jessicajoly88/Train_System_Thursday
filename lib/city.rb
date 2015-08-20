class City
  attr_reader(:name,:id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_cities = DB.exec("SELECT * FROM cities;")
    cities = []
    returned_cities.each() do |city|
      name = city.fetch('name')
      id = city.fetch('id').to_i()
      cities.push(City.new({:name => name, :id => id}))
    end
    cities
  end

  define_method(:save) do
    test_city = DB.exec("INSERT INTO cities (name) VALUES ('#{@name}') RETURNING id;")
    @id = test_city.first().fetch('id').to_i()
  end

  define_method(:==) do |another_city|
    self.name().==(another_city.name())
  end

  define_singleton_method(:find) do |id|
    returned_cities = City.all
    found_city = nil
      returned_cities.each() do |city|
        if city.id().==(id)
          found_city = city
        end
      end
      found_city
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE cities SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM cities WHERE id = #{self.id()};")
  end

end

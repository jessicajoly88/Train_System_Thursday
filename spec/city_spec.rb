require('spec_helper')

describe(City) do

  describe('#name') do
    it('returns the name of a city') do
      city = City.new({:name => 'Tokyo', :id => 'id'})
      expect(city.name()).to(eq('Tokyo'))
    end
  end

  describe('.all') do
    it('is an empty array at first') do
      expect(City.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a city to an array') do
      test_city = City.new({:name => 'Milan', :id => nil})
      test_city.save()
      expect(City.all()).to(eq([test_city]))
    end
  end

  describe('#==') do
    it('recognizes to objects as equal when they have the same properties') do
      test_city = City.new({:name => 'Milan', :id => nil})
      test_city2 = City.new({:name => 'Milan', :id => nil})
      expect(test_city).to(eq(test_city2))
    end
  end

  describe('.find') do
    it('finds a city based on ID number') do
      city = City.new({:name => 'Paris', :id => nil})
      city.save()
      expect(City.find(city.id)).to(eq(city))
    end
  end
end

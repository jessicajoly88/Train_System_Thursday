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
end

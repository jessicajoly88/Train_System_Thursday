require('spec_helper')

describe(Train) do
  describe('#name') do
    it('returns the name of the train') do
      train = Train.new({:name => 'Morning Train', :id => nil})
      expect(train.name()).to(eq('Morning Train'))
    end
  end

  describe('.all') do
    it ('is an empty array at first') do
      expect(Train.all()).to(eq([]))
    end
  end

end

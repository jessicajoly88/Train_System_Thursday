require('spec_helper')

describe(Train) do
  describe('#name') do
    it('returns the name of the train') do
      train = Train.new({:name => 'Morning Train', :id => nil})
      expect(train.name()).to(eq('Morning Train'))
    end
  end
end

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

  describe('#save') do
    it('saves a train to the array of trains') do
      test_train = Train.new({:name => 'Morning Train', :id => nil})
      test_train.save()
      expect(Train.all()).to(eq([test_train]))
    end
  end

  describe('#==') do
    it('recognizes two objects as equal when they have the same properties') do
      test_train = Train.new({:name => 'Morning Train', :id => nil})
      test_train2 = Train.new({:name => 'Morning Train', :id => nil})
     expect(test_train).to(eq(test_train2))
    end
  end

  describe('#id') do
    it('assigns an ID when you save a train') do
      train = Train.new({:name => 'Morning Train', :id => nil})
      train.save()
      expect(train.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('finds a train by ID number') do
      train = Train.new({:name => 'Morning Train', :id => nil})
      train.save()
      expect(Train.find(train.id)).to(eq(train))
    end
  end
end

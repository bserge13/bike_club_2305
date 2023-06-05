require './lib/ride'
require './lib/biker'

RSpec.describe Ride do 
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe '#initialize' do 
    it 'initializes with attributes' do 
      @biker = Biker.new("Kenny", 30)
    end

    it 'has a name' do 
      expect(@biker.name).to eq("Kenny")
    end

    it 'has a max distance of riding' do 
      expect(@biker.max_distance).to eq(30)
    end  

    it 'records rides' do 
      expect(@biker.rides).to eq({})
    end

    it 'tracks acceptable terrain for rides' do 
      expect(@biker.acceptable_terrain).to eq([]) 
    end

    it 'learns new terrain for rides' do 
      expect(@biker.acceptable_terrain).to eq([]) 
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])   
    end
  end

  describe '#initialize rides' do
    it 'initializes rides and attributes' do 
      @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    it 'logs rides distances and personal records' do 
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.rides).to eq({@ride1 => [92.5, 91.1], @ride2 => [60.9, 61.6]})
      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end 

    it 'tracks new riders rides' do 
      @biker2 = Biker.new("Athena", 15)
      @biker2.log_ride(@ride1, 97.0)
      @biker2.log_ride(@ride2, 67.0)
      expect(@biker2.rides).to eq({})
    end

    it 'learns new terrain' do
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker2.log_ride(@ride1, 95.0)
      @biker2.log_ride(@ride2, 65.0)
      expect(@biker2.rides).to eq({@ride2 => [65.0]})
      expect(@biker2.personal_record(@ride2)).to eq(65.0)
      expect(@biker2.personal_record(@ride1)).to eq(false)
    end
  end
end 
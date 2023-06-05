require './lib/ride'

RSpec.describe Ride do 
  before(:each) do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
  end

  describe '#initialize' do 
    it 'initializes with attributes' do 
      @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    end

    it 'has a name' do 
      expect(@ride1.name).to eq("Walnut Creek Trail")
    end

    it 'has a distance' do 
      expect(@ride1.distance).to eq(10.7)
    end

    it 'is not a loop' do
      expect(@ride1.loop).to eq(false)
    end

    it 'has tells what the terrain is' do 
      expect(@ride1.terrain).to eq(:hills)
    end
  end  
end 
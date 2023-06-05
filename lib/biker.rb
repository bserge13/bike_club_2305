class Biker 

  attr_reader :name, :max_distance, :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name 
    @max_distance = max_distance 
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, distance)
    # if @acceptable_terrain.includes?(ride.terrain) == true && @max_distance >= distance
    #   @rides << ride 
    # end
  end

  def personal_record(ride)
    
  end
end
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
      @rides[ride] = distance
      # this method requires more logic to not record distance if terrain is not acceptable
  end

  def personal_record(ride)
    @rides # didn't have time to finish the logic to go with method
  end
end
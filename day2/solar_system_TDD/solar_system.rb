class Planet
  attr_accessor :name, :description, :population
  def initialize(name, description, population)
    @name = name
    @description = description
    @population = population
  end

  def add_to_solar_system(system_name)
    system_name.add_planet(@name)
  end
end

class Solar_System
  attr_accessor :system_name
  def initialize(*name)
    if name == []
      @system_name = "Milky Way"
    else
      @system_name = name[0]
    end
    @planets = []
    @count = 0
  end

  def add_planet(name)
    @planets << name
    @count += 1
  end

  def super_nova
    @planets.clear
    @count = 0
  end

  def displayCount
    @count
  end

  def displayPlanets
    @planets
  end

  def displayInfo
    puts "\n #{@system_name}, #{@planets}, #{@count}"
  end
end

# galaxy = Solar_System.new("Andromeda")
# galaxy.displayInfo
# puts "\n #{galaxy.system_name}, #{galaxy.planets}, #{galaxy.count}"
# planet1 = Planet.new("Earth", "Where we live", 7000000000)
# puts planet1.name, planet1.description, planet1.population
# planet1.add_to_solar_system(galaxy)
# galaxy.displayInfo
# planet2 = Planet.new("Mars", "Where we wil live", 0)
# planet2.add_to_solar_system(galaxy)
# galaxy.displayInfo
# galaxy.super_nova
# galaxy.displayInfo
# galaxy.planets << "Sun"
# galaxy.count = 2
# galaxy.displayInfo

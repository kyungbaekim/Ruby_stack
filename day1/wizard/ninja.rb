require_relative 'human'

class Ninja < Human
  def initialize
    super
    @stealth = 175
  end

  def steal(obj)
    @health += 10
    obj.health -= 10
  end

  def get_away
    @health -= 15
  end
end

per1 = Human.new
puts "\nInformation of PER1"
per1.displayInfo
ninja1 = Ninja.new
ninja1.steal(per1)
puts "\nInformation of NINJA1"
ninja1.displayInfo
puts "\nInformation of PER1"
per1.displayInfo

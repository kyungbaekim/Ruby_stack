require_relative 'human'

class Samurai < Human
  @@no_samurai = 0
  def initialize
    @@no_samurai += 1
    super
    @health = 200
  end

  def death_blow(obj)
    obj.health = 0
  end

  def meditate
    @health = 200
  end

  def how_many
    puts @@no_samurai
  end
end

per1 = Human.new
puts "\nInformation of PER1"
per1.displayInfo
sam1 = Samurai.new
sam1.death_blow(per1)
puts "\nInformation of SAM1"
sam1.displayInfo
puts "\nInformation of PER1"
per1.displayInfo
per1.attack(sam1)
puts "\nInformation of SAM1"
sam1.displayInfo
sam1.meditate
puts "\nInformation of SAM1"
sam1.displayInfo
sam2 = Samurai.new
sam3 = Samurai.new
sam3.how_many

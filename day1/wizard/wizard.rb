require_relative 'human'

class Wizard < Human
  def initialize
    super
    @intelligence = 25
    @health = 50
  end

  def heal
    @health += 10
  end

  def fireball(obj)
    obj.health -= 20
  end
end

per1 = Human.new
wiz1 = Wizard.new
wiz2 = Wizard.new
wiz1.fireball(wiz2)
puts "\nInformation of WIZ2"
wiz2.displayInfo
wiz1.fireball(per1)
puts "\nInformation of PER1"
per1.displayInfo

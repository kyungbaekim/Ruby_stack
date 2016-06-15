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

wiz1 = Wizard.new

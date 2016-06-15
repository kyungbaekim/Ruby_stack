class Human
  attr_accessor :health
  def initialize
    @strength = 3
    @stealth = 3
    @intelligence = 3
    @health = 100
  end

  def attack(obj)
    if obj.class.ancestors.include? Human
      obj.health -= 10
      true
    else
      false
    end
  end
end

per1 = Human.new
per2 = Human.new
per1.attack(per2)
per2.display_info

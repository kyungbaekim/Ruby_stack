require_relative 'mammal'

class Dragon < Mammal
  def initialize
    @health = 170
    puts "Initial health for dragon is #{@health}"
  end

  def fly
    @health -= 10
    puts "Health after fly: #{@health}"
    self
  end

  def attack_town
    @health -= 50
    puts "Health after attack: #{@health}"
    self
  end

  def eat_human
    @health += 20
    puts "Health after meal: #{@health}"
    self
  end

  def displayHealth
    puts "\nThis is a dragon!"
    self
  end
end

Dragon.new.attack_town.attack_town.attack_town.eat_human.eat_human.fly.fly.displayHealth.DisplayHealth

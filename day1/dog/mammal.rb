class Mammal
  attr_accessor :health

  def initialize
    @health = 150
    puts "Initial health is #{@health}"
  end

  def pet
    @health += 5
    puts "Health after petted: #{@health}"
    self
  end

  def walk
    @health -= 1
    puts "Health after walk: #{@health}"
    self
  end

  def run
    @health -= 10
    puts "Health after run: #{@health}"
    self
  end

  def DisplayHealth
    puts "Current health is #{@health}"
    self
  end
end

require_relative 'mammal'

class Dog < Mammal
  # def initialize
  #   puts "Initial health for dog is #{@health}"
  # end
end

dog = Dog.new
dog.walk.walk.walk.run.run.pet.DisplayHealth

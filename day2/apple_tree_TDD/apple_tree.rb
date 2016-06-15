class Apple_Tree
  attr_accessor :height, :age, :apple_count
  def initialize(height, age)
    @height = height
    @age = age
    if age < 4
      @apple_count = 0
    elsif age < 11
      @apple_count = (age - 3) * 20
    end
  end

  def year_gone_by
    @age += 1
    @height *= 0.9
    if age > 3 && age < 11
      @apple_count += 20
    end
    puts "\nThe age of apple tree is #{@age}"
    puts "The height of apple tree is #{@height.round(2)}"
    puts "The count of apples on apple tree is #{@apple_count}"
  end

  def pick_apples
    @apple_count = 0
  end
end

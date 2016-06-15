class MathDojo
  def initialize
    @sum = 0
    puts "\nSum of new instance #{@sum}"
  end

  # Ruby takes optional parameter y as an array
  def add(x, *y)
    sum = 0
    puts "For add method, I got #{x} and #{y}"
    if !(y.empty?)
      if x.instance_of? Array
        x.each do |num|
          @sum += num
          puts @sum
        end
      else
        @sum += x
      end
      if y[0].instance_of? Array
        y[0].each do |num|
          @sum += num
          puts @sum
        end
      else
        @sum += y[0]
        puts @sum
      end
    else
      if x.instance_of? Array
        x.each do |num|
          sum += num
          puts sum
        end
        @sum += sum
      else
        @sum += x
      end
    end
    self
  end

  def subtract(x, *y)
    sum = 0
    puts "For subtract method, I got #{x} and #{y}"
    if !(y.empty?)
      if x.instance_of? Array
        x.each do |num|
          @sum -= num
          puts @sum
        end
      else
        @sum -= x
      end
      if y[0].instance_of? Array
        y[0].each do |num|
          @sum -= num
          puts @sum
        end
      else
        @sum -= y[0]
        puts @sum
      end
    else
      if x.instance_of? Array
        x.each do |num|
          sum -= num
          puts sum
        end
        @sum -= sum
      else
        @sum -= x
      end
    end
    self
  end

  # Displays the final value of instance sum
  def result
    puts "The final total of operation(s) is #{@sum}"
  end
end

arg1 = MathDojo.new
arg1.add(2)
arg1.add(2, 5)
arg1.subtract(3, 2)
arg1.subtract(3)
arg1.result

puts "\nFor chaining method"
MathDojo.new.add(2).add(2, 5).subtract(3, 2).result

MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2, 3], [1.1, 2, 3]).result

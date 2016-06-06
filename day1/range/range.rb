x = [1, 3, 5, 7, 2, 4, 11, 10]

puts "Class Name: #{x.class}"

puts x.shuffle
puts "It does include 2!" if x.include? 2
puts "3 is a member of this collection!" if x.member? 3
puts "The last number of this range is " + x.last.to_s
puts "The maximum number of this range is " + x.max.to_s
puts "The minimum number of this range is " + x.min.to_s

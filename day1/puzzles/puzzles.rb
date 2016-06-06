x = [3, 5, 1, 2, 7, 9, 8, 13, 25, 32]
y = ["John", "KB", "Oliver", "Cory", "Mattew", "Christopher"]
vowels = "aeiou"
str = "The first letter in shuffled array is a vowel"

def exercise1(arr)
  sum = 0
  arr.each do |num|
    sum += num
  end
  puts "Sum of numbers in the array is:", sum
  puts "Numbers greater than 10: ", arr.reject! {|num| num <= 10}.to_s
end
exercise1(x)

def exercise2(arr)
  arr.shuffle!
  puts "Shuffled array y: ", arr.to_s
  puts "Names longer than 5 characters: ", arr.reject! {|name| name.length < 5}.to_s
end
exercise2(y)

def exercise3(str, vowels)
  z = ('a'..'z').to_a
  puts z.to_s
  puts z.shuffle!.to_s
  puts "The last letter of shuffled array is: " + z.last
  puts "The first letter of shuffled array is: " + z.first
  puts str if vowels.include? (z.first)
end
exercise3(str, vowels)

def exercise4(count, m, n)
  # i = 0
  # arr = []
  # begin
  #   arr.push(rand(m..n))
  #   i += 1
  # end while i < count
  # puts arr.to_s
  puts count.times.map {rand(m..n)}.to_s
end
exercise4(10, 55, 100)

def exercise5(count, m, n)
  temp = count.times.map {rand(m..n)}
  puts temp.to_s
  puts temp.sort!.to_s
  puts "The minimum value in the array is: #{temp.first}"
  puts "The maximum value in the array is: #{temp.last}"
end
exercise5(10, 55, 100)

def exercise6
  str = ''
  i = 0
  begin
    str += (65 + rand(26)).chr
    i += 1
  end while i < 5
  puts str
end
exercise6

def exercise7
  arr = []
  str = ''
  i = 0
  begin
    5.times do
      str += (65 + rand(26)).chr
    end
    arr.push(str)
    str = ''
    i += 1
  end while i < 10
  puts arr.to_s
end
exercise7

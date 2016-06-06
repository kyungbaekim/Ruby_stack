x = [1, 5, 10, -2, 6, 121, 20]
y = [1, 3, 5, 7, 9, 13]

# print 1~255
i = 1
begin
  puts i
  i += 1
end while i < 256

# print odd numbers between 1~255
i = 1
begin
  puts i if i % 2 == 1
  i += 1
end while i < 256

# print sum
i = 0
sum = 0
begin
  puts "New number: #{i} Sum: #{sum}"
  i += 1
  sum += i
end while i < 256

# Iterating through an array
x.each {|i| puts i}

# Find Max
puts x.max

# Get Average
sum = 0
i = 0
begin
  sum += x.at(i)
  i += 1
end while i < x.length
puts sum / x.count

# Array with odd numbers
arr = []
i = 1
begin
  arr.push(i) if i % 2 == 1
  i += 1
end while i < 256
puts arr.to_s

# Greater than y
def getNumberofValues(arr, num)
  count = 0
  arr.each do |i|
    count += 1 if i > num
  end
  puts count
end
num = 3
getNumberofValues(x, num)

# Square the values
def squreValues(arr)
  arr.map! {|num| num ** 2}
  puts arr.to_s
end
squreValues(x)

# Eliminate negative numbers
def eliminateNegative(arr)
  arr.map! {|num| (num < 0) ? 0 : num}
  puts arr.to_s
end
eliminateNegative(x)

# Max, min and Average
def MMA(arr)
  min = arr[0]
  max = arr[0]
  sum = 0;
  arr.each do |num|
    min = num if num < min
    max = num if num > max
    sum += num
  end
  puts min, max, sum/arr.count
end
MMA(x)

# Shifting the values in the Array
def shift(arr)
  puts arr.to_s
  arr.shift
  arr.push(0)
  puts arr.to_s
end
shift(x)

# Number to string
def numToString(arr)
  arr.map! {|num| (num < 0) ? 'Dojo' : num}
  puts arr.to_s
end
numToString(x)

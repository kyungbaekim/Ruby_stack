a = {:first_name => "Michael", :last_name => "Choi"}
b = {:first_name => "John", :last_name => "Supsupin"}
c = {:first_name => "KB", :last_name => "Tonel"}
d = {:first_name => "Jessie", :last_name => "De Leon"}
e = {:first_name => "Jaybee", :last_name => "Balog"}
names = [a, b, c, d, e]

def printNames(arr)
  puts "You got #{arr.length} names in the 'names' array"
  arr.each do |e|
    puts "The name is '#{e[:first_name]} #{e[:last_name]}'"
  end
end

printNames(names)

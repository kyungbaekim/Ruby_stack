x = {"first_name": "Coding", "last_name": "Dojo"}

puts "x is ", x
puts "Delete a key with last_name"
x.delete(:last_name)
puts x

puts x.empty?

puts x.has_key?(:last_name)
puts x.has_value?("Coding")

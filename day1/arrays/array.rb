a = ["Matz", "Guido", "Dojo", "Choi", "John"]
b = [5, 6, 9, 3, 1, 2, 4, 7, 8, 10]
c = ["Dojo", 9]

puts a.at(a.length - 1)
a.delete("Guido")
puts a
puts b.delete_at(5)
puts b
puts b.reverse
puts c.length
puts b.sort
puts a.slice(0..2)
puts b.shuffle
puts a.join(" and ")
puts a.insert(a.length, "Kim")
puts b.values_at(1, 3, 5)

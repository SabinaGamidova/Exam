arr = ["tokyo", "london", "oslo"]
a = arr.each { |element| element.capitalize }
b = arr.map { |element| element.capitalize }

puts "\n"

puts "Initial arr:"
puts arr

puts "\n"

puts "After each:"
puts a

puts "\n"

puts "After map:"
puts b

puts "\n"
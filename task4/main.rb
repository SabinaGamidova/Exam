# Ex0
# 2.times do
#   puts "I'm a code block!"
# end  

# puts "\n"

# 3.times { puts "So am I!" }

# Ex1
# def my_method
#   puts "Start..."
#   yield if block_given? # Проверка наличия блока перед его выполнением
#   puts "End..."
# end

# my_method do
#   puts "Hello from yield!!!"
# end


# Ex2
# def each_with_block(array, &block)
#   array.each(&block)
# end

# each_with_block([1, 2, 3]) { |element| puts element }


# Ex3
# def execute_block(&block)
#   puts "Start..."
#   block.call if block_given?  # Проверка наличия блока перед его выполнением
#   puts "End..."
# end

# execute_block do
#   puts "Inside block"
# end
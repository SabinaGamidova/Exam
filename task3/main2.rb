DynamicClass = Class.new do
  define_method(:dynamic_method) do
    puts "Dynamic method"
  end
end

obj = DynamicClass.new
obj.dynamic_method
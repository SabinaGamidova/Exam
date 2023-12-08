class_name = "MyDynamicClass"
method_name = "dynamic_method"

Object.const_set(class_name, Class.new)
Object.const_get(class_name).class_eval do
    define_method(method_name) do
        puts "Hello World!"
    end
end

obj = Object.const_get(class_name).new
obj.dynamic_method
class Person
  def initialize(name)
    @name = name
  end
end

person = Person.new("Sabina")

person.define_singleton_method(:greet) do
  puts "Hello, #{@name}!"
end

person.greet
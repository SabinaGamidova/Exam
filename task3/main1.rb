ParentClass = Class.new do
  def parent_method
    puts "This is a method from the parent class!"
  end
end

ChildClass = Class.new(ParentClass) do
  def child_method
    puts "This is a method from the child class!"
  end
end

child_obj = ChildClass.new
child_obj.parent_method
child_obj.child_method
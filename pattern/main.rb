class Developer
  def developer_info
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end


class RubyDeveloper < Developer
  def developer_info
    'RubyDeveloper'
  end
end


class DeveloperDecorator < Developer
  attr_accessor :dev

  def initialize(dev)
    @dev = dev
  end

  def developer_info
    @dev.operation
  end

end


class JuniorRubyDeveloper < DeveloperDecorator
  def developer_info
    "JuniorRubyDeveloper(#{@dev.developer_info})"
  end
end


class MiddleRubyDeveloper < DeveloperDecorator
  def developer_info
    "MiddleRubyDeveloper(#{@dev.developer_info})"
  end
end


def client_code(dev)
  print "Result => #{dev.developer_info}"
end


simple = RubyDeveloper.new
puts 'Got a simple component:'
client_code(simple)
puts "\n\n"


decorator1 = JuniorRubyDeveloper.new(simple)
decorator2 = MiddleRubyDeveloper.new(decorator1)
puts 'Got a decorated component:'
client_code(decorator2)
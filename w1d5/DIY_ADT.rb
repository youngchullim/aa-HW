class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(el)
    self.stack += [el]
  end

  def pop
    self.stack -= [self.stack[-1]]
  end

  def peek
    self.stack[-1]
  end
  
end
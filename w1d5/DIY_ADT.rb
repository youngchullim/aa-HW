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

class Queue
  attr_accessor :queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    self.queue += [el]
  end

  def dequeue
    self.queue -= [self.queue[0]]
  end

  def peek
    self.queue[0]
  end
end
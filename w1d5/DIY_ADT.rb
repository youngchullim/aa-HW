class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(el)
    self.stack += [el]
    nil
  end

  def pop
    removed = self.stack[-1]
    self.stack -= [self.stack[-1]]
    return removed
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
    nil
  end

  def dequeue
    removed = self.queue[0]
    self.queue -= [removed]
    return removed
  end

  def peek
    self.queue[0]
  end
end

class Map
  attr_accessor :mapp

  def initialize
    @mapp = []
  end

  def set(key, val)
    self.mapp << [key,val] if self.mapp.empty?

    self.mapp.each do |arr|
      arr[1] = val if arr[0] == key
      self.mapp << [key,val] if self.mapp.none? {|sub_arr| sub_arr[0] == key}
    end
    nil
  end

  def get(key)
    self.mapp.each do |arr|
      return arr if arr[0] == key
    end
    nil
  end

  def delete(key)
    selected = self.mapp.select {|arr| arr[0] == key}
    removed = selected.flatten
    if selected.length < 1
      return nil
    else
      self.mapp -= [removed]
      return removed
    end
  end

  def show
    self.mapp
  end
end
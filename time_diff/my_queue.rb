class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    el = @store.pop
  end

  def see_max
    peek.max
  end

  def see_min
    peek.min
  end

  def push(el)
    if @max.nil? || el > @max
      @max = el
    end

    if @min.nil? || el < @min
      @min = el
    end

    @store << {value: el, max: @max, min: @min}
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @holding_stack = MyStack.new
    @stack = MyStack.new
  end

  def enqueue(el)
    @stack.push(el)
  end

  def dequeue
    until @stack.empty?
      @holding_stack.push(@stack.pop)
    end

    el_wanted = @holding_stack.pop

    until @holding_stack.empty?
      @stack.push(@holding_stack.pop)
    end

    el_wanted
  end

  def size
    @stack.size
  end

  def empty?
    @stack.empty?
  end
end

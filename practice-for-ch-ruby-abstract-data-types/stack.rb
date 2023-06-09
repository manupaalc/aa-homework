class Stack
  def initialize
    # create ivar to store stack here!
    @store = []
  end

  def push(el)
    # adds an element to the stack
    @store.push(val)
  end

  def pop
    # removes one element from the stack
    @store.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @store.last
  end
  def size
    @stor.length
  end
  def empty?
    @store.empty?
  end
end
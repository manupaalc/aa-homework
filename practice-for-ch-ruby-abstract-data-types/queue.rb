class MyQueue

   def initialize
    @store = []
   end
   def enqueue(el)
    @store.push[el]
   end
   def dequeue
    @store.shift
   end
   def show
    @store.dup
   end
   def size
    @store.length
   end
   def empty?
    @store.empty?
   end

end
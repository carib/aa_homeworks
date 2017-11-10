class Queue
  def initialize
    @ivar = []
  end
  
  def enqueue(el)
    @ivar.unshift(el)
  end
  
  def dequeue
    @ivar.pop
  end
  
  def show
    @ivar.to_s
  end
end
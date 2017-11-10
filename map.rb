class Map
  def initialize
    @ivar = []
  end
  
  def assign(key, value = nil)
    keys = @ivar.map(&:first)
    vals = @ivar.map(&:last)
    kindex ||= keys.index(key)
    if kindex
      vals[kindex] = value
      @ivar = keys.zip(vals)
    else
      @ivar.push([key, value])
    end
  end
  
  def lookup(key)
    @ivar.select { |pair| pair.first == key }.flatten.last
  end
  
  def remove(key)
    @ivar.reject! { |pair| pair.first == key }
  end
  
  def show
    str = ""
    @ivar.each_with_index do |pair, i|
      key, val = pair
      str += "\n" if i > 0 && i % 3 == 0
      str += "  #{key} => #{val},"
      
    end
    puts "{\n#{str}\n}"
  end
  
  def [](key)
    lookup(key)
  end
  
  def []=(key, val)
    assign(key, val)
  end
end
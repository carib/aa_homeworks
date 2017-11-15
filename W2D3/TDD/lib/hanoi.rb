class HanoiGame 
  attr_reader :towers 
   
  def initialize(towers = [[3,2,1],[],[]])   
    @towers = towers
  end 
  
  def get_move 
    puts "Make a move"
    move = gets.chomp 
    move = move.scan(/\d/).map(&:to_i)
  end 
  
  def valid_move?(move)
    from, to = move 
    return false if self.towers[from].empty?
    return true if self.towers[to].empty?
    return self.towers[from].last < self.towers[to].last     
  end 
  
  def move(from_to)
    if valid_move?(from_to)
      from, to = from_to
      self.towers[to].push(self.towers[from].pop)
    else
      puts "Not a valid move."
      get_move
    end
  end 
  
  def won?
    towers.drop(1).any? { |t| t.count == 3 }
  end
  
  private 
  attr_writer :towers
end 
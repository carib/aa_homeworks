class Piece
  def initialize
  end
  
  def moves(pos)
  end
  
  def to_s(color)
    var = ":p"
    "|#{var.colorize(color)}|"
  end
end

class NullPiece < Piece  
  def to_s(color)
    var = "__"
    "|#{var.colorize(:background => color)}|"
  end
end

module SlidingPiece
  def moves(pos)
  end
end

module SteppingPiece
  def moves(pos)
  end
end
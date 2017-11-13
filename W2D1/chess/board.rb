class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }
    @grid.map!.with_index do |row, i|
      [0, 1, 6, 7].include?(i) ? row.map! { |pos| pos = Piece.new } : row
    end
  end
  
  def move_piece(start_pos, end_pos)
    raise StandardError.new("No piece") if self[start_pos].is_a?(NullPiece) || self[start_pos].nil?
    raise StandardError.new("Occupied") if self[end_pos].is_a?(Piece)
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = nil
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end
  
  def in_bounds(diff)
    diff.all? { |el| el < 9 && el > -1 }
  end
  
  def display(cursor_pos)
    str = ""
    @grid.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        if pos.is_a?(NullPiece)
          [i,j] == cursor_pos ? str += pos.to_s(:red) : str += pos.to_s(:light_blue)
        else
          [i,j] == cursor_pos ? str += pos.to_s(:red) : str += pos.to_s(:light_blue)
        end
        # str[-4..-1].colorize(:red) if [i, j] == cursor_pos
      end
      str += "\n"
    end
    str
  end
end

class Piece
  
  def initialize
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
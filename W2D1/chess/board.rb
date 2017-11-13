class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) { nil } }
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
end

class Piece
end

class NullPiece < Piece
end
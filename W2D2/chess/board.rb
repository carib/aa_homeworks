require_relative 'piece'
class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance() } }
    @grid.map!.with_index do |row, i|
      [0, 1, 6, 7].include?(i) ? row.map! { |pos| pos = Piece.new } : row
    end
  end

  def move_piece(start_pos, end_pos)
    raise StandardError.new("No piece") if self[start_pos].is_a?(NullPiece)
    raise StandardError.new("Occupied") if self[end_pos].is_a?(Piece)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance()
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def empty?(pos)
    self[pos].empty?
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def in_bounds(diff)
    diff.all? { |el| el < 8 && el > -1 }
  end

  def display(cursor_pos)
    str = ""
    @grid.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        [i,j] == cursor_pos ? str += pos.to_s(:red) : str += pos.to_s(:light_blue)
      end
      str += "\n"
    end
    str
  end
end

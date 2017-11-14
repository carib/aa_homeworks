require 'byebug'
require 'singleton'
require_relative 'cursor'

class Piece
  attr_reader :symbol

  def initialize
    # @current_pos = [2,3]
    # @current_board = nil
    @symbol = :p
  end

  def empty?
    self.is_a?(NullPiece)
  end

  def valid_moves
    #return array of moves available to self (calls moves(pos)
    #selects moves down based on piece movement logic?
  end

  def moves(pos)
  end

  def update_board(board)
    @current_board = board
  end

  def to_s(color)
    var = self.symbol
    "|#{var.colorize(color)}|"
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = :_
  end

  def to_s(color)
    var = "__"
    "|#{var.colorize(:background => color)}|"
  end
end

module SlidingPiece

  @mock_cursor = nil

  def moves(pos)
    #returns possible moves
  end

  # private

  def move_dirs
    # debugger
    @mock_cursor = Cursor.new(@current_pos, Board.new)
    moves = []
    case self.symbol
    when :b #diagonal for bishops
      diagonal_dirs.each do |arr|
        moves << grow_unblocked_moves_in_dir(arr)
      end
      #call diagonal_dirs
    when :r #horizontal/vertical for rooks
      #call horizontal_dirs
    when :q #both for queens
      #call both
    end
    moves
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    debugger
    moves = []
    pos = @mock_cursor.cursor_pos
    cpos = @current_pos
    pos = cpos
    while @mock_cursor.board.empty?(pos)
      dir_arr.each_with_index do |key, i|
        pos = @mock_cursor.get_position(key)
        moves << @mock_cursor.cursor_pos if i == dir_arr.length - 1
      end
    end
    moves
  end
=begin
load 'piece.rb'
b = Bishop.new
brd = Board.new
b.update_board(brd)
b.move_dirs
=end
  # def horizontal_dirs
  #   row, col = @current_pos
  #   x = Array.new(7) { col }
  #   y = Array.new(7) { row }
  #   x_moves = (0..7).to_a.reject { |x| x == col }
  #   y_moves = (0..7).to_a.reject { |y| y == row }
  #   x.zip(y_moves) + x_moves.zip(y)
  # end

  def horizontal_dirs
    [[:left], [:right], [:up], [:down]]
    #%i(left right up down)
  end

  # def diagonal_dirs
  #   up = up_moves
  #   down = down_moves
  #   zips = [up[0].zip(up[1]), down[0].zip(down[1]), up[0].zip(down[1]), down[0].zip(up[1])]
  #   zips.flatten(1).reject { |pair| pair.include?(nil) }
  # end

  def diagonal_dirs
    [[:left, :up],[:left, :down],[:right, :up],[:right, :down]]
  end

  def up_moves
    y, x = @current_pos
    xdown = []
    ydown = []
    @current_pos.each_with_index do |pos, i|
      pos.downto(1) { |n| i == 1 ? xdown << pos -= 1 : ydown << pos -= 1 }
    end
    [ydown, xdown]
  end

  def down_moves
    y, x = @current_pos
    xup = []
    yup = []
    @current_pos.each_with_index do |pos, i|
      pos.upto(6) { |n| i == 1 ? xup << pos += 1 : yup << pos += 1 }
    end
    [yup, xup]
  end

end

module SteppingPiece
  def moves(pos)
  end
end

class Bishop < Piece
  include SlidingPiece
  def initialize
    @symbol = :b
    @current_pos = [2, 3]
  end

end

class Rook < Piece
  include SlidingPiece

end

class Queen < Piece
  include SlidingPiece
end

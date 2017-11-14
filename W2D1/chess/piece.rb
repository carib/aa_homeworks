require 'byebug'
require 'singleton'
require_relative 'cursor'

class Piece
  attr_reader :symbol

  def initialize
    @current_board = nil
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

  def moves
    #returns possible moves
    move_dirs
  end

  private

  def move_dirs
    moves = []
    case symbol
    when :b then moves << dirs(diagonal_dirs)
    when :r then moves << dirs(horizontal_dirs)
    else
      [horizontal_dirs, diagonal_dirs].each do |set|
        moves << dirs(set)
      end
    end
    moves.flatten(1)
  end

  def dirs(dir)
    dir.each_with_object([]) do |dir, arr|
      arr << grow_unblocked_moves_in_dir(dir)
    end.flatten(1).reject { |xy| xy.empty? }
  end


  def horizontal_dirs
    [[0, -1], [0, 1], [-1, 0], [1, 0]]
  end

  def diagonal_dirs
    [[-1, -1],[-1, 1],[1, -1],[1, 1]]
  end

  def grow_unblocked_moves_in_dir(dir)
    # debugger
    moves = []
    next_pos = @current_pos.zip(dir).map { |coord| coord.reduce(:+) }
    while @current_board.in_bounds(next_pos) && @current_board[next_pos].empty?
      moves << next_pos
      next_pos = next_pos.zip(dir).map { |coord| coord.reduce(:+) }
    end
    moves
  end
=begin
load 'piece.rb'
b = Bishop.new
brd = Board.new
b.update_board(brd)
b.moves
=end
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
  def initialize
    @symbol = :r
    @current_pos = [2, 3]
  end
end

class Queen < Piece
  include SlidingPiece
  def initialize
    @symbol = :q
    @current_pos = [2, 3]
  end
end

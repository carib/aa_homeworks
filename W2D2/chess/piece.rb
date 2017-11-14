require 'byebug'
require 'singleton'
require 'colorize'

class Piece
  attr_reader :symbol
  attr_accessor :current_pos

  def initialize
    @current_board = nil
    @symbol = nil
    @current_pos = nil
  end

  def self.make_piece(symbol)
  end

  def empty?
    self.is_a?(NullPiece)
  end

  def valid_moves
    #return array of moves available to self (calls moves(pos)
    #selects moves down based on piece movement logic?
  end

  def moves
  end

  def next_pos(dir)
    classes = [Queen, Rook, Bishop]
    dir.each_with_object([]) do |dir, arr|
      next_pos = @current_pos.zip(dir).map { |coord| coord.reduce(:+) }
      if classes.include?(self.class)
        while @current_board.in_bounds(next_pos) && @current_board[next_pos].empty?
          arr << next_pos
          next_pos = next_pos.zip(dir).map { |coord| coord.reduce(:+) }
        end
      else
        arr << next_pos if @current_board.in_bounds(next_pos) && @current_board[next_pos].empty?
      end
    end
  end

  def update_board(board)
    @current_board = board
  end

  def to_s(color)
    var = ":#{symbol}"
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

class Pawn < Piece
  def initialize
    @symbol = :p
    @start_row = @current_pos.first
  end

  def moves
  end

  protected

  def at_start_row?
    @current_pos.first == @start_row
  end

  def forward_dir
    4 > @start_row
  end

  def forward_steps
    forward_dir ? [[1, 0]] : [[-1, 0]]
  end

  def side_attacks
    forward_dir ? [[1, 1], [1, -1]] : [[-1, -1], [-1, 1]]
  end
end


module Slideable
  def moves
    move_dirs
  end

  private

  def move_dirs
    moves = []
    case symbol
    when :b then moves << next_pos(diagonal_dirs)
    when :r then moves << next_pos(horizontal_dirs)
    else
      [horizontal_dirs, diagonal_dirs].each do |set|
        moves << next_pos(set)
      end
    end
    moves.flatten(1)
  end

  def horizontal_dirs
    [[0, -1], [0, 1], [-1, 0], [1, 0]]
  end

  def diagonal_dirs
    [[-1, -1],[-1, 1],[1, -1],[1, 1]]
  end
end

module Steppable
  def moves
    move_diffs
  end

  def move_diffs
  end
end

class Bishop < Piece
  include Slideable
  def initialize
    @symbol = :b
    @current_pos = nil
  end
end

class Rook < Piece
  include Slideable
  def initialize
    @symbol = :r
    @current_pos = nil
  end
end

class Queen < Piece
  include Slideable
  def initialize
    @symbol = :q
    @current_pos = nil
  end
end

class King < Piece
  include Steppable
  def initialize
    @symbol = :k
    @current_pos = [0,3]
  end

  def moves
    next_pos(move_diffs)
  end

  def move_diffs
    [[0, -1], [0, 1], [-1, 0], [1, 0], [-1, -1], [-1, 1], [1, -1], [1, 1]]
  end
end

class Knight < Piece
  include Steppable
  def initialize
    @symbol = :h
    @current_pos = [2,3]
  end

  def moves
    next_pos(move_diffs)
  end

  def move_diffs
    [[2, 1], [2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2], [-2, -1], [-2, 1]]
  end
end

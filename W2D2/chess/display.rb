require 'colorize'
require_relative 'cursor' #==> initializes with @cursor_pos
require_relative 'board'
require 'byebug'


class Display
  attr_accessor :cursor
  def initialize(board = Board.new)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    system("clear")
    puts @board.display(@cursor.cursor_pos)
  end

  def display_test
    loop do
      puts "input?"
      @cursor.get_input
      render
    end
  end
end

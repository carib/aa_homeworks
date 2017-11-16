require_relative 'card'

class Deck
  attr_accessor :cards
  SUITS = %w[Spades Hearts Diamonds Clubs]
  RANK = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
  
  def initialize
    @cards = []
  end
  
  def build_deck
    SUITS.each do |suit|
      RANK.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
  end
  
  def shuffle!
    self.cards.shuffle!
  end
  
  def deal!
    @cards.pop
  end
end
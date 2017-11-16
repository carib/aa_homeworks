class Card
  include Comparable
  
  attr_reader :suit, :rank, :value
  FACES = {
    'Jack' => 11, 'Queen' => 12,
    'King' => 13, 'Ace' => 14
  }
  
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    @value = FACES.keys.include?(rank) ? FACES[rank] : @rank.to_i
  end
  
  def <=>(other)
    self.value <=> other.value
  end
end
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  describe '#initialize' do
    it 'initializes with an empty array' do
      expect(deck.cards).to be_empty
    end
  end
  
  describe '#build_deck' do
    before do
      deck.build_deck
    end
    
    it 'should fill the deck with 52 cards' do
      expect(deck.cards.size).to eq(52)
    end
    
    it 'should not add the same card twice' do
      sorted = deck.cards.sort
    end
  end
  
  describe '#shuffle!' do
    it 'should move the cards around' do
      deck.build_deck
      first = deck.cards.first
      deck.shuffle!
      expect(deck.cards.first).not_to be(first)
    end
  end
  
  describe '#deal!' do
    it 'should return the top card from the deck' do
      top_card = deck.cards.last
      expect(deck.deal!).to be(top_card)
    end
  end
end


=begin

=end
require 'card'

describe Card do
  # it needs a suit
  # it needs a rank
  subject(:card) { Card.new('Spades', 'Eight') }
  it 'should have a suit' do
    expect(card.suit).to eq('Spades')
  end
  
  it 'should have a rank' do
    expect(card.rank).to eq('Eight')
  end
end
require 'card'

describe Card do
  let(:jack) { Card.new('Hearts', 'Jack') }
  subject(:eight) { Card.new('Spades', '8') }
  it 'should have a suit' do
    expect(eight.suit).to eq('Spades')
  end
  
  it 'should have a rank' do
    expect(eight.rank).to eq('8')
  end
  
  it 'should have a numeric value' do
    expect(eight.value).to eq(8)
  end
  
  it 'should have a numeric value for face cards' do
    expect(jack.value).to eq(11)
  end
  
  it 'should know how it ranks against another card' do
    expect(jack).to be > eight
  end
end
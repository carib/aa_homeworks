require 'hand'

describe Hand do
  subject(:hand) { Hand.new }
  describe '#initialize' do
    it 'should initialize with an empty array' do
      expect(hand.cards).to be_empty
    end
    
    it 'should raise an error if more than five cards are given'
  end
  
  describe '#total_value' do
    it 'should know have a numeric value' do
      expect(hand.total_value).to eq(8)
    end
  end
end

# it 'should know the ranking of hands'
# it 'should know how it ranks against another hand'

=begin
- Hand
  - total_value
  - ranking of hands
  - five cards
=end
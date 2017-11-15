require 'hanoi'

describe HanoiGame do 
  subject(:hanoi) {HanoiGame.new}
  describe '#initialize' do 
    it 'should initialize with an array of three arrays' do 
      expect(hanoi.towers.size).to be(3)
    end 
    
    it 'first array should contain three consecutive integers in descending order' do
      sorted = hanoi.towers.first.sort.reverse
      expect(hanoi.towers.first).to eq(sorted)
    end
  end
  
  describe '#get_move' do
    before(:example) do
      @move = hanoi.get_move
    end
    
    it 'should return an array' do
      expect(@move).to be_a(Array)
    end
    
    it 'should return a valid move' do
      expect(hanoi).to receive(:valid_move?).and_return(true)
    end
  end
end 


=begin 

DONE
- @towers 
TODO:
- move 
- won? 
- play 
- get_move 
- valid_move? 


=end 
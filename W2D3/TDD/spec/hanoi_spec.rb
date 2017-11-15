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
    
  describe '#valid_move?' do 
    let(:moved_game) { HanoiGame.new([[3, 2], [], [1]]) }
    context "move is valid" do 
      let(:valid) {[0,1]}
      it 'should return a valid move' do
        expect(moved_game.valid_move?(valid)).to be(true)
      end
    end 
    
    context "move is invalid" do 
      let(:invalid_empty) {[1, 0]}
      let(:invalid_size) {[0, 2]}
      
      it 'should check if from tower is empty' do
        expect(moved_game.valid_move?(invalid_empty)).to be(false)
      end
      
      it 'should check if last element in from tower is smaller than that in to tower' do
        expect(moved_game.valid_move?(invalid_size)).to be(false)
      end
    end 
  end 
  
  describe "#move" do
      it "should check if move is valid" do 
        expect(hanoi).to receive(:valid_move?).with([0,1])
        hanoi.move([0,1])
      end 

      it 'should move last element from tower to to_tower' do
        hanoi.move([0,1])
        expect(hanoi.towers).to eq([[3, 2], [1], []])
      end 

      it 'should ask for another move if move is invalid' do
        expect(hanoi).to receive(:get_move)
        hanoi.move([1, 0])
      end 
  end 
  
  describe "#won?" do 
    let(:won_game) { HanoiGame.new([[], [], [3, 2, 1]]) }
    it 'should check if not original tower is length three' do
      expect(won_game.won?).to be_truthy
    end
  end 
end 


=begin 

DONE
- @towers 
- get_move 
- valid_move? 
TODO:
- move 
- won? 
- play 


=end 
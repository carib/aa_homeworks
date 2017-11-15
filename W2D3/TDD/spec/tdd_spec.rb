require 'tdd'

describe Array do
  describe '#my_uniq' do
    let(:dup_array) { [1, 2, 1, 3, 3] }
    let(:all_dups_array) { [3, 3, 3, 3, 3, 3, 3] }
    context 'when the elements are of varied values' do
      it "should remove all duplicate elements" do
        expect(dup_array.my_uniq).to eq([1, 2, 3])
      end
    end
    
    context 'when the elements are all of equal value' do
      it 'should return an array with a single element' do
        expect(all_dups_array.my_uniq.length).to eq(1)
      end
    end
  end
  
  describe '#two_sum' do
    let(:sum_arr) {[-1,0,2,-2,1]}
    let(:no_sum) {[1,2,3,4]}
    let(:one_sum) {[-1,1]}
    
    context "when certain elements sum to zero" do 
      it "should return an array of arrays" do 
        expect(one_sum.two_sum).to be_a(Array)
      end 
      
      it "should return the indexes of the elements that sum to zero" do 
        indices = one_sum.two_sum
        expect(indices.sort).to eq(indices)
      end 
      
      it "the indices in the child arrays should be in sorted order" do
        sorted = sum_arr.two_sum.map(&:sort)
        expect(sorted).to eq(sum_arr.two_sum)
      end
    end 

    context "when no elements sum to zero" do 
      it "should return an empty array" do 
        expect(no_sum.two_sum).to be_empty
      end 
    
    end 
  end
  
  describe '#my_transpose' do 
    let(:matrix) {[
                  [0, 1, 2],
                  [3, 4, 5],
                  [6, 7, 8]
                  ]}
    
    describe "column" do 
      it "should contain the first elements from each row of the orginal matrix" do 
        
        column = matrix.map(&:first)
        expect(matrix.my_transpose.first).to eq(column)
      end 
    end 
  end 
  
  describe '#stock_picker' do
    let(:big_win) { [1, 22, 3, 21, 5] }
    let(:no_win) { [2,2,2,2,2] }
    let(:two_win) {[1, 22, 0, 21, 5]}
    
    context "when there's no win" do 
      it "should return zero" do 
         expect(no_win.stock_picker).to be_zero  
      end 
    end
     
    context "when there's a big win early" do 
      it 'should correctly return the earlier day' do 
        expect(big_win.stock_picker).to eq([0,1])
      end 
    end  
    
    context "when there's two big wins" do 
      it "should correctly return the bigger win" do 
        expect(two_win.stock_picker).to eq([2,3])
      end 
    end 
  end
end

# [0, 12]








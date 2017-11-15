require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double('chef', name: 'Boyardee') }
  let(:dessert) { Dessert.new('Ice Cream', 3, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Ice Cream")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to be(3)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new('type', 'three', 'chef') }.to raise_error(ArgumentError)
    end
  end


  context 'with ingredients added' do
    before do
      dessert.add_ingredient('milk')
      dessert.add_ingredient('vanilla')
      dessert.add_ingredient('sugar')
    end

    describe "#add_ingredient" do
      it "adds an ingredient to the ingredients array" do
        expect(dessert.ingredients).to include('milk')
      end
    end

    describe "#mix!" do
      it "shuffles the ingredient array" do
        dessert.mix!
        expect(dessert.ingredients).not_to eq(['milk', 'vanilla', 'sugar'])
      end
    end

    describe "#eat" do
      it "subtracts an amount from the quantity" do
        dessert.eat(1)
        expect(dessert.quantity).not_to eq(3)
      end

      it "raises an error if the amount is greater than the quantity" do
        expect{ dessert.eat(15) }.to raise_error('not enough left')
      end
    end

    describe "#serve" do
      it "contains the titleized version of the chef's name" do
        expect(dessert.serve).to include("Boyardee")
      end
    end

    describe "#make_more" do
      it "calls bake on the dessert's chef with the dessert passed in" do
        dessert.make_more
        expect(chef).to receive(bake(dessert.ingredients))
      end
    end
  end
end

require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) {Dessert.new("cake", 10, chef)}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("cake", "10", "Gordon") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients << "egg").to eq(["egg"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['a','b','c','d']

      ingredients.each do |el|
        dessert.add_ingredient(el)
      end
      expect(dessert.ingredients).to eq(dessert.ingredients)
      dessert.mix!
      expect(dessert.ingredients).not_to eq(ingredients.sort)
      expect(dessert.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(5)
      expect(dessert.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(11) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    let(:chef) {"Gordon"}
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to eq("Gordon has made 10 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end

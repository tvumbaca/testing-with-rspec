require_relative '../lib/my_enumerable'

describe "Enumerable" do

  let(:test_arr) { [1,2,3] }

  describe "#my_each" do
    
    context "when no block is given" do
      it "returns self" do
        expect(test_arr.my_each).to eql([1, 2, 3])
      end
    end

    context "when given a block" do
      it "passes each item in an array to the block" do
        arr = []
        test_arr.my_each { |i| arr << i+3 }
        expect(arr).to eql([4, 5, 6])
      end

      it "returns empty array if called on an empty array" do
        arr = []
        [].my_each { |i| arr << i+3 }
        expect(arr).to eql([])
      end
    end

  end

  describe "#my_select" do
    
    context "when no block is given" do
      it "returns an Enumerator" do
        expect(test_arr.my_select).to be_an_instance_of(Enumerator)
      end
    end

    context "when a block is given" do
      it "returns an array of items that satisfy the block" do
        expect(test_arr.my_select { |i| i > 1 }).to eql([2,3])
      end

      it "returns an empty array if no items satisfy the block" do
        expect(test_arr.my_select { |i| i > 7 }).to eql([])
      end

      it "returns an empty array if the caller is an empty array" do
        expect([].my_select { |i| i = 2 }).to eql([])
      end

      it "returns an empty hash if the caller is an empty hash" do
        expect({}.my_select { |i| i = 2 }).to eql({})
      end
    end

  end

  describe "#my_all?" do
    
    context "when no block is given" do
      it "returns true if all items are truthy" do
        expect([1, 2, true, "cat"].my_all?).to be_truthy
      end

      it "returns false if any item is falsey" do
        expect([1, 2, nil, false].my_all?).to be_falsey
      end
    end

    context "when a block is given" do
      it "returns true when ALL itmes in the caller evaluate to TRUE in the block" do
        expect(test_arr.my_all? { |i| i > 0 }).to eql(true)
      end

      it "returns false when any itmes in the caller evaluate to FALSE in the block" do
        expect(test_arr.my_all? { |i| i > 2 }).to eql(false)
      end

      it "returns true if the caller is an empty array or hash" do
        expect({}.my_all? { |i| i > 0 }).to eql(true)
      end
    end

  end

  describe "#my_any?" do
    
    context "when no block is given" do
      it "returns true if any items are truthy" do
        expect([false, 2, true, "cat"].my_any?).to be_truthy
      end

      it "returns false if ALL items are falsey" do
        expect([nil, false].my_any?).to be_falsey
      end
    end

    context "when a block is given" do
      it "returns true when any itmes in the caller evaluate to TRUE in the block" do
        expect(test_arr.my_any? { |i| i > 2 }).to eql(true)
      end

      it "returns false when ALL itmes in the caller evaluate to FALSE in the block" do
        expect(test_arr.my_any? { |i| i > 8 }).to eql(false)
      end

      it "returns false if the caller is an empty array or hash" do
        expect({}.my_any? { |i| i > 0 }).to eql(false)
      end
    end
    
  end

  describe "#my_count" do
    
    context "when no block is given" do
      it "returns the length of the caller if no argument given" do
        expect(test_arr.my_count).to eql(3)
      end

      it "returns the number of items in the caller that match the argument" do
        expect(test_arr.my_count(2)).to eql(1)
      end
    end

    context "when a block is given" do
      it "returns the number of itmes in the caller that satisfy the block" do
        expect(test_arr.my_count { |i| i > 2 }).to eql(1)
      end

      context "when also given an argument" do
        it "it ignors the block and returns the number of items in the caller that match the argument" do
          expect(test_arr.my_count(1) { |i| i > 1 }).to eql(1)
        end
      end
    end
    
  end

  describe "#my_map" do
    
    context "when no block is given" do
      it "returns an Enumerator" do
        expect(test_arr.my_map).to be_an_instance_of(Enumerator)
      end
    end

    context "when a block is given" do
      it "returns an array of items from each element in the caller applied to the block" do
        expect(test_arr.my_map { |i| i * 3 }).to eql([3,6,9])
      end

      it "returns an empty array if the caller is empty" do
        expect([].my_map { |i| i * 3 }).to eql([])
      end
    end
    
  end

end

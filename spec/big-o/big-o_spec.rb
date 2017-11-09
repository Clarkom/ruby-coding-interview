require './big-o/big-o'

RSpec.describe BigONotation do

  #
  #
  # Add Item To An Array O(1)
  describe '#addItemToArray' do

    # Small List
    context 'if the list is small' do

      before do
        @small_list = [67]
        @prev_size = @small_list.size
        @algorithm = BigONotation.new(@small_list)
      end

      it 'should increment the size of the array by 1 item' do
        @algorithm.addItemToArray(128)
        expect(@small_list.size). to eq (@prev_size + 1)
      end

      it 'should increment the size of the array by 2 items' do
        @algorithm.addItemToArray(36)
        @algorithm.addItemToArray(51)
        expect(@small_list.size).to eq (@prev_size + 2)
      end

      it 'should perform under 0.1 second' do
        expect {
          @algorithm.addItemToArray(17)
        }.to perform_under(0.1).sec
      end

    end

    # Big List
    context 'if the list is big' do
      before do
        @small_list = Array.new(1) { rand(1..4) }
        @big_list = Array.new(30) { rand(20..100) }
      end

      it 'should perform under 0.1 second' do
        @algorithm_2 = BigONotation.new(@big_list)

        expect {
          @algorithm_2.addItemToArray(12)
        }.to perform_under(0.1).sec

      end
    end

  end

  # Pushing and Popping into the Stack O(1)
  describe '#pushAndPopToStack' do

    before do
      @list = [45, 87, 123, 65]
      @algorithm = BigONotation.new(@list)
    end

    it 'should add one item into the last index' do
      @algorithm.pushAndPopToStack(@list, 54, 'push')
      expect(@list[-1]).to eq 54
    end

    it 'should remove one item from the end of the list' do
      @algorithm.pushAndPopToStack(@list, 54, 'push')
      @algorithm.pushAndPopToStack(@list, 'pop')
      expect(@list[-1]).to_not eq 54
      expect(@list[-1]).to eq 65
    end

  end

  #
  #
  # Bubble Sort O(N^2)
  describe '# bubbleSort' do

    it 'sorts the list correctly' do
      @list = [12, 34, 56]
      @algorithm = BigONotation.new(@list)
      expect(@algorithm.bubbleSort).to eq @list.sort
    end

  end

end

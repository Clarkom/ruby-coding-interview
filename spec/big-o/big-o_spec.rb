require './big-o/big-o'

RSpec.describe BigONotation do

  # Add Item To An Array O(1)
  describe '# addItemToArray' do

    context 'if the array is small' do

      before do
        @list = [67]
        @list_2 = Array.new(4) { rand(1..60) }
        @prev_size = @list.size
        @algorithm = BigONotation.new(@list)
        @algorithm_2 = BigONotation.new(@list_2)
      end

      it 'it increment the size by 1 item' do
        @algorithm.addItemToArray(128)
        expect(@list.size). to eq (@prev_size + 1)
      end

      it 'it increment the size by 2 items' do
        @algorithm.addItemToArray(36)
        @algorithm.addItemToArray(51)
        expect(@list.size).to eq (@prev_size + 2)
      end

      #it 'it has the same amout of running time' do
      #  expect {
      #    @algorithm_2.addItemToArray(78)
      #  }.to perform_under(0.01).and_sample(10)
      #end

    end

  end

  # Bubble Sort O(N^2)
  describe '# bubbleSort' do

    it 'sorts the list correctly' do
      @list = [12, 34, 56]
      @algorithm = BigONotation.new(@list)
      expect(@algorithm.bubbleSort).to eq @list.sort
    end

  end

end

require './big-o/big-o'
require 'benchmark/ips'

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

      xit 'should increment the size of the array by 1 item' do
        @algorithm.addItemToArray(128)
        expect(@small_list.size). to eq (@prev_size + 1)
      end

      xit 'should increment the size of the array by 2 items' do
        @algorithm.addItemToArray(36)
        @algorithm.addItemToArray(51)
        expect(@small_list.size).to eq (@prev_size + 2)
      end

      xit 'should perform under 0.1 second' do
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

      xit 'should perform under 0.1 second' do
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

    xit 'should add one item into the last index' do
      @algorithm.pushAndPopToStack(@list, 54, 'push')
      expect(@list[-1]).to eq 54
    end

    xit 'should remove one item from the end of the list' do
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

    before do
      @algorithm = BigONotation.new
    end

    xit 'sorts the list correctly' do
      @list = Array.new(20) { rand 2..67 }
      expect(@algorithm.bubbleSort(@list)).to eq @list.sort
    end

    it 'takes more time if the list is big' do

      small_list = Array.new(2) { rand(1..10) }
      big_list = Array.new(100) { rand(1..1000) }

      message = Benchmark.ips do |x|
        x.report('small list:') { @algorithm.bubbleSort(small_list) }
        x.report('big list:') { @algorithm.bubbleSort(big_list) }
        x.compare!
      end

      ap message.entries[0]
      ap message.entries[1]

    end

  end

end

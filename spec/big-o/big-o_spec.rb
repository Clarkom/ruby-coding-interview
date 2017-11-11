require './big-o/big-o'
require 'benchmark/ips'

RSpec.describe BigONotation do

  before do
    @algorithm = BigONotation.new
  end

  #
  #
  # Add Item To An Array O(1)
  describe '#addItemToArray' do

    # Small List
    context 'if the list is small' do

      before do
        @list = Array.new(4) { rand 3..74 }
        @prev_size = @list.size
      end

      xit 'should increment the size of the array by 1 item' do
        ap @list.size
        @algorithm.addItemToArray(@list, 128)
        expect(@list.size). to eq (@prev_size + 1)
      end

      xit 'should increment the size of the array by 2 items' do
        @algorithm.addItemToArray(@list, 36)
        @algorithm.addItemToArray(@list, 51)
        expect(@list.size).to eq (@prev_size + 2)
      end

      xit 'should perform under 0.1 second' do
        expect {
          @algorithm.addItemToArray(@list, 17)
        }.to perform_under(0.1).sec
      end
    end

    # Big List
    context 'if the list is big' do
      before do
        @big_list = Array.new(30) { rand(20..100) }
      end

      xit 'should perform under 0.1 second' do
        expect {
          @algorithm.addItemToArray(@big_list, 12)
        }.to perform_under(0.1).sec

      end
    end
  end

  # Pushing and Popping into the Stack O(1)
  describe '#pushAndPopToStack' do

    before do
      @list = [45, 87, 123, 65]
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
  # Bubble Sort O(n^2)
  describe '# bubbleSort' do

    it 'should sorts the list correctly' do
      @list = Array.new(20) { rand 2..67 }
      expect(@algorithm.bubbleSort(@list)).to eq @list.sort
    end

    it 'should takes more time sorting a big list' do

      small_list = Array.new(1) { rand(1..10) }
      big_list = Array.new(20) { rand(1..50) }

      reports = Benchmark.ips(:quiet => true) do |x|
        x.report('big list:') { @algorithm.bubbleSort(big_list) }
        x.report('small list:') { @algorithm.bubbleSort(small_list) }
        x.compare!
      end

      ap reports.entries[0].stats.error

    end

  end

  #
  #
  # Insertion Sort O(n^2)
  describe '# insertionSort' do

  end

end

require './big-o/big-o'
require 'benchmark/ips'

RSpec.describe BigONotation do

  before do
    @algorithm = BigONotation.new
  end

  #
  #
  # Add Item To An Array O(1)
  describe '#addItemToArray', skip: true do

    # Small List
    context 'if the list is small' do

      before do
        @list = Array.new(4) { rand 3..74 }
        @prev_size = @list.size
      end

      it 'should increment the size of the array by 1 item' do
        ap @list.size
        @algorithm.addItemToArray(@list, 128)
        expect(@list.size). to eq (@prev_size + 1)
      end

      it 'should increment the size of the array by 2 items' do
        @algorithm.addItemToArray(@list, 36)
        @algorithm.addItemToArray(@list, 51)
        expect(@list.size).to eq (@prev_size + 2)
      end

      it 'should perform under 0.1 second' do
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

      it 'should perform under 0.1 second' do
        expect {
          @algorithm.addItemToArray(@big_list, 12)
        }.to perform_under(0.1).sec

      end
    end
  end

  # Pushing and Popping into the Stack O(1)
  describe '#pushAndPopToStack', skip: true do

    before do
      @list = [45, 87, 123, 65]
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
  # Bubble Sort O(n^2)
  describe '# bubbleSort', skip: true do

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
  describe '# insertionSort', skip: true do

    before do
      @list = [1, 5, 3, 4, 6, 3]
      @ordered_list = [1, 3, 3, 4, 5, 6]
    end

    it 'should sorts the list correctly' do
      expect(@algorithm.insertionSort(@list)).to eq @ordered_list
    end

  end

  #
  #
  # Quick Sort O(n * log(n))
  describe '# quickSort' do

    before do
      @list = [1, 3, 7, 12, 5, 45].shuffle
      @ordered_list = [1, 3, 5, 7, 12, 45]
    end

    it 'should sort the list correctly' do
      @algorithm.quickSort(@list)
      expect(@list).to eq @ordered_list
    end

  end

end

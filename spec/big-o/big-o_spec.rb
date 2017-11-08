require './big-o/big-o'

RSpec.describe BigONotation do

  describe '# bubbleSort' do

    context '# with a 4 size list' do
      it 'sorts the list correctly' do
        list = [12, 13, 54, 43]
        algorithm = BigONotation.new(list)
        expect(algorithm.bubbleSort).to eq list.sort
      end
    end

  end

end

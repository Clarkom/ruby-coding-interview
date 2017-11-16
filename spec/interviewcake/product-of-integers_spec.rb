require 'awesome_print'
require './interviewcake/product-of-integers'

RSpec.describe ProductOfIntegers do

  before do
    @integers_list = [1, 7, 3, 4]
    @product = ProductOfIntegers.new
  end

  describe '# product_v1' do

    it 'get the product of all integers on the list expect the integer at the index' do
      expect(@product.product_v1(@integers_list)).to eq [84, 12, 28, 21]
    end

  end

end

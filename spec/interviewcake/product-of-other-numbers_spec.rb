require 'awesome_print'
require './interviewcake/product-of-other-numbers'

RSpec.describe do

  it 'should return an array with the product of integers except at that index' do
    list = [3, 1, 2, 5, 6, 4]
    get_the_product_of_all_ints_except_at_index(list)
  end

end

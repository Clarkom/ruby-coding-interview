require 'awesome_print'
require './interviewcake/stock-price'

RSpec.describe StockPrice do

  before do
    @stock_price = StockPrice.new
  end

  describe '# get_max_profit_bruteforce' do

    it 'should return the max_profit for the best deal' do
      yesterday_stock_prices = [10, 7, 5, 8, 11, 9]
      # return 6 (buying for 5 and selling for 11)
      max_profit = @stock_price.get_max_profit_bruteforce(yesterday_stock_prices)
      expect(max_profit).to eq(6)
    end

  end

end

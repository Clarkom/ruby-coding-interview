require 'awesome_print'
require './interviewcake/stock-price'

RSpec.describe StockPrice do

  before do
    @yesterday_stock_prices = [10, 7, 5, 8, 11, 9]
    @stock_price = StockPrice.new
  end

  describe '# get_max_profit_v1' do

    it 'should return the max_profit for the best deal' do
      # return 6 (buying for 5 and selling for 11)
      max_profit = @stock_price.get_max_profit_v1(@yesterday_stock_prices)
      expect(max_profit).to eq(6)
    end

  end

  describe '# get_max_profit_v2' do

    it 'should return the max_profit of the best deal too' do
      max_profit = @stock_price.get_max_profit_v2(@yesterday_stock_prices)
      expect(max_profit).to eq(6)
    end

  end

  describe '# get_max_profit_v3' do

    it 'should get the max profit by going through the list Once' do
      max_profit = @stock_price.get_max_profit_v3(@yesterday_stock_prices)
      expect(max_profit).to eq(6)
    end

  end

end

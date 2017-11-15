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

  describe '# get_max_profit_v4' do

    it 'should raise an argument error if the prices list is less than 2' do
      yesterday_stock_prices = [7]
      max_profit = @stock_price.get_max_profit_v4(yesterday_stock_prices)
      expect(yesterday_stock_prices.length).to be < 2
      expect(max_profit).to eq 'Getting a profit requires at least 2 prices'
    end

    it 'should return a negative profit if the value go down' do
      yesterday_stock_prices = [12, 9, 6]
      max_profit = @stock_price.get_max_profit_v4(yesterday_stock_prices)
      expect(max_profit.negative?).to be true
      expect(max_profit).to eq(-3)
    end

    it 'should return 0 if all values are similar' do
      yesterday_stock_prices = [34, 34, 34]
      max_profit = @stock_price.get_max_profit_v4(yesterday_stock_prices)
      expect(max_profit).to eq(0)
    end

  end

end

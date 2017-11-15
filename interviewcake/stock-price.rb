require 'awesome_print'

class StockPrice

  # Write an efficient method that takes stock_prices_yesterday and
  # return the best profit you could have made for 1 purchase
  # and 1 sale of 1 Apple stock yesterday
  #
  # O(n) * O(n) = O(n^2)
  def get_max_profit_v1(stock_prices_yesterday)

    max_profit = 0

    # go through every time
    # O(n)
    (0...stock_prices_yesterday.length).each do |outer_time|

      # for every time, go through every Other Time
      # O(n)
      (0...stock_prices_yesterday.length).each do |inner_time|
        #puts stock_prices_yesterday[inner_time]

        # for each pair, find the earlier and later times
        earlier_time = [outer_time, inner_time].min
        later_time   = [outer_time, inner_time].max

        # and use those to find the earlier and later prices
        earlier_price = stock_prices_yesterday[earlier_time]
        later_price   = stock_prices_yesterday[later_time]

        # see what our profit would be if we bought at the
        # earlier price and sold at the later price
        potential_profit = later_price - earlier_price


        # update max_profit if we can do better
        max_profit = [max_profit, potential_profit].max

      end
    end

    max_profit
  end


  # Because we now that we buy before we sell
  # so in inner for loop we could just look
  # at every price after the price in our
  # outer loop
  #
  # Get Max Profit Without looking at
  # every pair twice
  # O(n^2)
  def get_max_profit_v2(yesterday_stock_prices)

    max_profit = 0

    # go through every price (with its index as the time)
    yesterday_stock_prices.each_with_index do |earlier_price, earlier_time|

      # and go through all Later Prices
      (yesterday_stock_prices[+1..-1]).each do |later_price|

        # see what our profit will be if we bought at the
        # earlier price and sold at the later price
        potential_profit = later_price - earlier_price

        # update max_profit if we can do better
        max_profit = [max_profit, potential_profit].max

      end

    end

    max_profit
  end


  # By using the greedy approach
  # let's keep a running max_profit
  # until we reach the end
  # So we've to keep track of lowest price
  # and check if we can get better profit
  #
  # We go through the list once
  # O(n)
  def get_max_profit_v3(yesterday_stock_prices)

    min_price = yesterday_stock_prices[0]
    max_profit = 0

    # go through every price on the list
    yesterday_stock_prices.each do |current_price|

      # ensure min price is lowest price we've seen so far
      min_price = [min_price, current_price].min

      # see what our profit woudl be if we bought at the
      # min price and sold at the current price
      potential_profit = current_price - min_price

      # update max_profit if we can do better
      max_profit = [max_profit, potential_profit].max

    end

    max_profit

  end

end



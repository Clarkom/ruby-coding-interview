require 'awesome_print'

class StockPrice

  # Write an efficient method that takes stock_prices_yesterday and
  # return the best profit you could have made for 1 purchase
  # and 1 sale of 1 Apple stock yesterday
  #
  # O(n) * O(n) = O(n^2)
  def get_max_profit_bruteforce(stock_prices_yesterday)

    max_profit = 0

    # go through every time
    # O(n)
    (0...stock_prices_yesterday.length).each do |outer_time|

      #puts "-----------------------------------"
      #puts "[#{outer_time}]: #{stock_prices_yesterday[outer_time]}"
      #puts "-----------------------------------"

      # for every time, go through every Other Time
      # O(n)
      (0...stock_prices_yesterday.length).each do |inner_time|
        #puts stock_prices_yesterday[inner_time]

        # for each pair, find the earlier and later times
        earlier_time = [outer_time, inner_time].min
        later_time   = [outer_time, inner_time].max
        #puts "earlier_time = [#{outer_time}, #{inner_time}].min = #{earlier_time}"

        # and use those to find the earlier and later prices
        earlier_price = stock_prices_yesterday[earlier_time]
        later_price   = stock_prices_yesterday[later_time]
        #puts "earlier_price = stock_prices_yesterday[#{earlier_time}] = #{earlier_price}"

        # see what our profit would be if we bought at the
        # earlier price and sold at the later price
        potential_profit = later_price - earlier_price
        #puts "potential_profit = #{later_price} - #{earlier_price} = #{potential_profit}"


        # update max_profit if we can do better
        max_profit = [max_profit, potential_profit].max
        #puts "max_profit = [#{max_profit}, #{potential_profit}] = #{max_profit}"

      end
    end

    max_profit
  end

end



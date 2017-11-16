class ProductOfIntegers

  # Find the product of every integer
  # on the list except the integer at
  # that index
  #
  # O(n^2)
  def product_v1(list_of_integers)

    products_list = []

    # iterate through the integers
    list_of_integers.each_with_index do |outer_integer, index|

      # reset products on the first iteration
      products = 1

      # iterate through the integers expect the
      # integer at that index by using the if statement
      (0..list_of_integers.length - 1).each do |inner_integer|
        if index != inner_integer
          products *= list_of_integers[inner_integer]
          products_list[index] = products
        end
      end

    end

    products_list
  end

end

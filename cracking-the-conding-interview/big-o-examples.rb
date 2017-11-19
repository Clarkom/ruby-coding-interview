# O(n) - First Loop
# O(n) - Second Loop
# O(n) + O(n) = O(2n)
# We drop the constant 2
#
# The fact that we iterate through
# the array twice doesn't matter
# Final Result = O(n)
def foo(numbers)

  sum = 0
  product = 1

  (0...numbers.length).each_with_index do |number, index|
    sum += numbers[index]
  end

  (0...numbers.length).each_with_index do |number, index|
    product *= numbers[index]
  end

  puts "#{sum}, #{product}"

end

# O(n) - Outer Loop
# O(n) - Inner Loop
# The inner for loop has O(n) iterations
# and it's called n times
# O(n) * O(n) = O(n^2)
#
# Final Result = O(n^2)
def printPairs(numbers)

  (0...numbers.length).each do |outer_index|
    (0...numbers.length).each do |inner_index|
      puts "#{outer_index}, #{inner_index}"
    end
  end

end


# The IF statement inside the inner loop is O(1) time
# since it's just a sequence of constant-time statements
# For each element of arrayA, the inner for loop goes
# through b iterations
# It's not O(n^2), because there are two different inputs
#
# Final Result: O(ab)
def printUnorderedPairs(arrayA, arrayB)

  (0...arrayA.length-1).each do |outer_index|
    (0..arrayB.length-1).each do |inner_index|
      if arrayA[outer_index] < arrayB[inner_index]
        puts "#{arrayA[outer_index]}, #{arrayB[inner_index]}"
      end
    end
  end

end

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

numbers = [3, 2, 4]
foo(numbers)

require 'awesome_print'

# Get the second largest number from a given list of number
# that contain [1, 3, 4, 5, 0, 2]
# The function return Null if the array is empty
# The Function return Null if the array has only one element
def second_largest(numbers)
  if !numbers.empty? && numbers.size > 1

    largest = nil
    second_largest = nil

    for number in numbers

      if largest == nil
        puts "largest == nil  : largest = #{number}"
        largest = number

      elsif number > largest
        puts '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
        puts "number > largest: ELSEIF #{number} > #{largest} THEN second_largest = #{largest}"
        puts "number > largest: ELSEIF #{number} > #{largest} THEN largest = #{number}"
        puts '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
        second_largest = largest
        largest = number

      elsif second_largest == nil
        puts "second_largest == nil   : second_largest = #{number}"
        second_largest = number

      elsif number > second_largest
        puts "number > second_lagest  : second_largest = #{number}"
        second_largest = number

      end
    end

    second_largest

  end
end

numbers = [1, 3, 5, 120, 2, 34, 24, 469, 89, 53, 22,24, 565, 34]
second_largest(numbers)


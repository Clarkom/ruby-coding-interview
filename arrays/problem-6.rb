require 'awesome_print'

# Get the second largest number from a given list of number
# that contain [1, 3, 4, 5, 0, 2]
# The function return Null if the array is empty
# The Function return Null if the array has only one element
def second_largest(numbers)

  if !numbers.empty? && numbers.size > 1

    maximum = numbers[0]

    numbers.each_with_index do |number, index|
      if maximum < numbers[index]
        maximum = numbers[index]
        numbers.delete_at(index)
      end
    end

    puts maximum

  end

end

numbers = [34, 9456, 4356, 1034, 5, 128]
second_largest(numbers)

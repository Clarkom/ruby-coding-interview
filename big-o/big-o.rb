require 'awesome_print'
require 'benchmark'

class BigONotation

  def initialize(items)
    @theArray = items
    @itemsInArray = 0
  end

  # An Algorithm that executes in the same
  # time regardless of the amount of data
  # This code executes in the same amount of
  # time no matter how big the array is
  #
  # O(1)
  def addItemToArray(newItem)
    @theArray[@itemsInArray += 1] = newItem
    return @theArray
  end

  # Pushing and Popping into the Stack
  #
  # O(1)
  def pushAndPopToStack(list, newItem = nil, option)
    if (option == 'push')
      list.push(newItem)
    end
    if (option == 'pop')
      list.pop
    end

    return @theArray
  end

  # An Algorithm thats time to complete will
  # grow in direct proportion to the amount of data
  # The linear search in a example of this
  #
  # To Find all values that match what we
  # are searching for, we will have to look
  # exactly each item in the array
  #
  # If we just wanted to find one match the Big O
  # is the same because it describes the worst
  # case scenario in which the whole array must
  # be searched
  #
  # O(n)
  def linearSearch(value)
    valueInArray = ""

    time_elapsed = Benchmark.measure {
      for i in 0..(@theArray.size - 1)
        if @theArray[i] == value[i]
          valueInArray += value[i]
        end
      end
    }

    puts "Linear Search Tooks #{time_elapsed}"
    puts "Value Found: #{valueInArray}"

  end

  # Time to complete will be proportional to
  # the square of the amount of data (Bubble Sort)
  # Algorithms with more nested iterations will result
  # in O(N^3), O(N^4), etc. performance
  #
  # Each pass through teh outer loop (0)N require us
  # to go through the entire list again si N multiplies
  # against itself or it is squared
  #
  # This Function will walk through the list until
  # there are non longer any swaps to make
  # meaning, the list is sorted
  #
  # O(N^2)
  def bubbleSort

    @arraySize = @theArray.size

    loop do
      swapped = false
      (@arraySize - 1).times do |i|
        if @theArray[i] > @theArray[i+1]
          @theArray[i], @theArray[i+1] = @theArray[i+1], @theArray[i]
          swapped = true
        end
      end

      break if not swapped
    end

    @theArray
  end

end

require 'awesome_print'
require 'benchmark'

class BigONotation

  # An Algorithm that executes in the same
  # time regardless of the amount of data
  # This code executes in the same amount of
  # time no matter how big the array is
  #
  # O(1)
  def addItemToArray(list, newItem)
    itemsInArray = list.size - 1
    list[itemsInArray += 1] = newItem
    return list
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
  # O(n^2)
  def bubbleSort(list)

    # Get the size of the list
    arraySize = list.size

    loop do

      # Set the default value of swapped to false
      swapped = false

      # Go through the list One by One
      (arraySize - 1).times do |i|

        # Check if the previous element on the list
        # is greater than the next one
        if (list[i] > list[i+1])

          # if the condition is true
          # Swappe the two selected number using
          # Parallel Assignement
          list[i], list[i+1] = list[i+1], list[i]

          # Set swapped to true, if there are non checked
          # elements on the list
          swapped = true

        end

      end

      # No swapping left
      break if not swapped
    end

    # Return the Sorted Array
    list
  end

  #
  #
  #
  #
  # O(n^2)
  def insertionSort(list)
	  final = [list[0]]
    list.delete_at(0)
    # main code
    for i in list
      final_index = 0
      while final_index < final.length
        if i <= final[final_index]
          final.insert(final_index,i)
          break
        elsif final_index == final.length-1
          final.insert(final_index+1,i)
          break
        end
        final_index+=1
      end
    end
    # output
    final
  end


	#
  #
  # O(n * log(n))
	def quickSort(array, from=0, to=nil)
    if to == nil
        # Sort the whole array, by default
        to = array.count - 1
    end

    if from >= to
        # Done sorting
        return
    end

    # Take a pivot value, at the far left
    pivot = array[from]

    # Min and Max pointers
    min = from
    max = to

    # Current free slot
    free = min

    while min < max
        if free == min # Evaluate array[max]
            if array[max] <= pivot # Smaller than pivot, must move
              array[free] = array[max]
              min += 1
              free = max
            else
              max -= 1
            end
        elsif free == max # Evaluate array[min]
            if array[min] >= pivot # Bigger than pivot, must move
              array[free] = array[min]
              max -= 1
              free = min
            else
              min += 1
            end
        else
          raise "Inconsistent state"
        end
    end

    array[free] = pivot

    quickSort array, from, free - 1
    quickSort array, free + 1, to
	end

	#
	#
	# O(n * lg(n))
  def mergeSort(array)
    if array.count <= 1
      # Array of length 1 or less is always sorted
      return array
    end

    # Apply "Divide & Conquer" strategy

    # 1. Divide
    mid = array.count / 2
    part_a = mergeSort array.slice(0, mid)
    part_b = mergeSort array.slice(mid, array.count - mid)

    # 2. Conquer
    array = []
    offset_a = 0
    offset_b = 0
    while offset_a < part_a.count && offset_b < part_b.count
      a = part_a[offset_a]
      b = part_b[offset_b]

      # Take the smallest of the two, and push it on our array
      if a <= b
        array << a
        offset_a += 1
      else
        array << b
        offset_b += 1
      end
    end

    # There is at least one element left in either part_a or part_b (not both)
    while offset_a < part_a.count
      array << part_a[offset_a]
      offset_a += 1
    end

    while offset_b < part_b.count
      array << part_b[offset_b]
      offset_b += 1
    end

    return array
  end

end


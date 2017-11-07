# Write a function that takes two numbers as string and check the greather one
# The two strings should not be empty
# The two numbers are always non-negative
# Equal Numbers Should Return False
# Solve the problem without using to_i
def larger_than(number_1, number_2)

  if number_1.length > number_2.length
    return true

  elsif number_1 == number_2
    return false

  elsif number_1.length < number_2.length
    return false

  elsif number_1.length == number_2.length
    for i in 0..(number_1.length)
      if number_1[i] == number_2[i]
        next
      elsif number_1[i] > number_2[i]
        return true
      else
        return false
      end
    end

  end

end

p larger_than('771', '770')


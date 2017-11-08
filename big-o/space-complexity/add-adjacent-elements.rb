# Just Because an n call does not mean that it takes O(n) space
# Ex: Add Adjacent Elements between 0 and n

def pairSumSequence(n)
  sum = 0

  for i in 0..n
    # pairSum calls do not exist simultabeously on
    # the call stack, so you only need O(1) space
    sum += pairSum(i, i + 1)
    puts "sum += (#{i + i + 1}) #{i} + #{i} + 1 "
  end

  return sum
end

def pairSum(a, b)
  a + b
end

p pairSumSequence(4)


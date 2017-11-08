# O(n) time and O(n) Space
def sum(n)

  if (n <= 0)
    return 0
  end

  puts "#{n} + sum(#{n} - 1)"
  # each call add a level to the stack
  return n + sum(n - 1)

end

p sum(4)


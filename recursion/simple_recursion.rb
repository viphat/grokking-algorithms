# Simple Recursion
# Call Stack
# Functional Programming does not have loops, It uses Recursion only
# Sum up an array using Recursion
# Divide and conquer
module SimpleRecursion
  def self.sum(arr)
    p arr
    return 0 if arr.empty?
    arr.first + sum(arr[1..-1])
  end
end

# What is Tail Recursion -
# http://stackoverflow.com/questions/33923/what-is-tail-recursion
module SimpleTailRecursion
  def self.sum(arr, index, total = 0)
    p arr
    return total if index.zero?
    sum(arr[1..-1], index - 1, total + arr[index])
  end
end

# Recursion
def fact(n)
  return 1 if n <= 1
  n * fact(n - 1)
end

# Ruby Tail Call Optimization - http://nithinbekal.com/posts/ruby-tco/
RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

# Tail Recursion
def tail_fact(n, acc = 1)
  return acc if n <= 1
  tail_fact(n - 1, n * acc)
end

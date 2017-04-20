require 'pry'
# Quick Sort
# O(n * log n)
# rubocop:disable all
class QuickSort
  attr_reader :original_arr

  def initialize(arr)
    raise ArgumentError unless arr.class == Array
    @original_arr = arr
  end

  def quick_sort(arr = original_arr)
    return arr if arr.empty? || arr.length == 1
    mid = (0 + arr.length - 1) / 2
    pivot = arr[mid]
    lower_elements = arr.select { |x| x < pivot }
    equal_or_higher_elements = []
    arr.each_with_index do |x, index|
      next unless x >= pivot && index != mid
      equal_or_higher_elements << x
    end
    quick_sort(lower_elements) + [pivot] + quick_sort(equal_or_higher_elements)
  end
end

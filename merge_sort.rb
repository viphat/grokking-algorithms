require 'pry'
# Merge Sort
# O(n * log n)
# rubocop:disable all
# Step 1 − if it is only one element in the list it is already sorted, return.
# Step 2 − divide the list recursively into two halves until it can no more be divided.
# Step 3 − merge the smaller lists into new list in sorted order.
class MergeSort
  attr_reader :original_arr

  def initialize(arr)
    raise ArgumentError unless arr.class == Array
    @original_arr = arr
  end

  def merge_sort(arr = original_arr)
    return arr if arr.empty? || arr.length == 1
    m = (arr.length - 1) / 2
    l_arr = arr[0..m]
    r_arr = arr[m+1..-1]
    l_arr = merge_sort(l_arr)
    r_arr = merge_sort(r_arr)
    merge(l_arr, r_arr)
  end

  def merge(l_arr, r_arr)
    sorted_arr = []
    sorted_arr_index = 0
    while (l_arr.length > 0 && r_arr.length > 0) do
      sorted_arr[sorted_arr_index] =
        if l_arr[0] > r_arr[0]
          r_arr.shift
        else
          l_arr.shift
        end
      sorted_arr_index += 1
    end

    until l_arr.empty? do
      sorted_arr[sorted_arr_index] = l_arr.shift
      sorted_arr_index += 1
    end

    until r_arr.empty? do
      sorted_arr[sorted_arr_index] = r_arr.shift
      sorted_arr_index += 1
    end
    p sorted_arr
    sorted_arr
  end
end

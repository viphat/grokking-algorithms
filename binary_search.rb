# rubocop:disable all
# BinarySearch using Recursion
class BinarySearch
  attr_reader :sorted_arr, :value
  def initialize(sorted_arr, value)
    raise ArgumentError unless sorted_arr.class == Array
    raise ArgumentError unless value.class == Fixnum
    @sorted_arr = sorted_arr
    raise ArgumentError unless check_if_array_is_sorted_asc
    @value = value
  end

  def check_if_array_is_sorted_asc
    sorted_arr.each_with_index do |value, index|
      return true if index + 1 == sorted_arr.length
      return false if value > sorted_arr[index + 1]
    end
  end

  def search(start_index = 0, end_index = sorted_arr.length - 1)
    mid = (start_index + end_index) / 2
    # Break point
    return mid if sorted_arr[mid] == value
    # Break point
    return if start_index > end_index
    # Too low
    return search(mid + 1, end_index) if sorted_arr[mid] < value
    # Too hight
    return search(start_index, mid - 1) if sorted_arr[mid] > value
  end
end

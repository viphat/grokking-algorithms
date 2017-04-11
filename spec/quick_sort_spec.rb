require 'spec_helper'
require_relative '../quick_sort.rb'
# rubocop:disable all
describe 'QuickSort' do
  context 'Receive array as agrument' do
    it { expect { QuickSort.new([1, 2, 3]) }.not_to raise_error }
    it { expect { QuickSort.new('I am a string') }.to raise_error(ArgumentError) }
  end

  context 'Returns sorted array' do
    it { expect(QuickSort.new([5, 1, 2, 3]).quick_sort).to eq [1, 2, 3, 5] }
    it { expect(QuickSort.new([-5, 9999, -1, 1, -1, 0, 1]).quick_sort).to eq [-5, -1, -1, 0, 1, 1, 9999] }
  end
end

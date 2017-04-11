require 'spec_helper'
require_relative '../merge_sort.rb'
# rubocop:disable all
describe 'MergeSort' do
  context 'Receive array as agrument' do
    it { expect { MergeSort.new([1, 2, 3]) }.not_to raise_error }
    it { expect { MergeSort.new('I am a string') }.to raise_error(ArgumentError) }
  end

  context 'Returns sorted array' do
    it { expect(MergeSort.new([5, 1, 2, 3]).merge_sort).to eq [1, 2, 3, 5] }
    it { expect(MergeSort.new([-5, 9999, -1, 1, -1, 0, 1]).merge_sort).to eq [-5, -1, -1, 0, 1, 1, 9999] }
  end
end

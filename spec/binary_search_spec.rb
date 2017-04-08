require 'spec_helper'
require_relative '../binary_search.rb'
# rubocop:disable all
describe 'BinarySearch' do
  context 'Receive two agruments: an array & integer value' do
    it { expect { BinarySearch.new([], 1) }.not_to raise_error }
    it { expect { BinarySearch.new([]) }.to raise_error(ArgumentError) }
    it { expect { BinarySearch.new(-1) }.to raise_error(ArgumentError) }
    it { expect { BinarySearch.new('I am a string', 1) }.to raise_error(ArgumentError) }
    it { expect { BinarySearch.new([], 'I am a string') }.to raise_error(ArgumentError) }
  end

  context 'Receive sorted asc array as an valid agrument' do
    it { expect { BinarySearch.new([1, 2, 3, 4, 5], 1)}.not_to raise_error }
    it { expect { BinarySearch.new([-1, 2, 4, 4, 5], 1)}.not_to raise_error }
    it { expect { BinarySearch.new([3, -1, 1, 4, 5], 1)}.to raise_error(ArgumentError) }
  end

  context 'Return array\'s found index if finding_value is in array' do
    it { expect(BinarySearch.new([1, 2, 3, 4, 5], 4).search).to eq 3}
    it { expect(BinarySearch.new([2, 4, 6, 8, 10], 2).search).to eq 0}
    it { expect(BinarySearch.new([-1, 4, 6, 8, 10], 10).search).to eq 4}
  end

  context 'Return nil if finding_value isn\'t in array' do
    it { expect(BinarySearch.new([2, 4, 6, 8, 10], 9).search).to be_nil}
    it { expect(BinarySearch.new([-1, 4, 6, 8, 10], 10).search).not_to be_nil}
  end
end

require 'pry'
require 'spec_helper'
require_relative '../data_structure/doubly_linked_list.rb'

describe 'DoublyLinkedList::List' do
  let(:list)  { DoublyLinkedList::List.new }
  let(:node5) { DoublyLinkedList::Node.new(5) }
  let(:node6) { DoublyLinkedList::Node.new(6) }
  let(:node7) { DoublyLinkedList::Node.new(7) }

  it 'Play with #insert_first #1' do
    list.insert_first(node5)
    expect(list.display_forward).to eq [5]
    expect(list.head_node.data).to eq 5
    expect(list.tail_node.data).to eq 5
  end

  it 'Play with #insert_first #2' do
    list.insert_first(node5)
    list.insert_first(node7)
    expect(list.display_forward).to eq [7, 5]
    expect(list.head_node.data).to eq 7
    expect(list.tail_node.data).to eq 5
  end

  it 'Play with #delete_first #1' do
    list.insert_first(node5)
    list.delete_first
    expect(list.display_forward).to eq []
    expect(list.head_node).to eq nil
    expect(list.tail_node).to eq nil
  end

  it 'Play with #delete_first #2' do
    list.insert_first(node5)
    list.insert_first(node6)
    list.delete_first
    expect(list.display_forward).to eq [5]
    expect(list.head_node.data).to eq 5
    expect(list.tail_node.data).to eq 5
  end

  it 'Play with #insert_last #1' do
    list.insert_last(node5)
    expect(list.display_forward).to eq [5]
    expect(list.head_node.data).to eq 5
    expect(list.tail_node.data).to eq 5
  end

  it 'Play with #insert_last #2' do
    list.insert_last(node5)
    list.insert_last(node6)
    expect(list.display_forward).to eq [5, 6]
    expect(list.head_node.data).to eq 5
    expect(list.tail_node.data).to eq 6
  end

  it 'Play with #delete_last #1' do
    list.insert_last(node5)
    list.delete_last
    expect(list.display_forward).to eq []
    expect(list.head_node).to eq nil
    expect(list.tail_node).to eq nil
  end

  it 'Play with #delete_last #1' do
    list.insert_last(node5)
    list.insert_last(node6)
    list.delete_last
    expect(list.display_forward).to eq [5]
    expect(list.head_node.data).to eq 5
    expect(list.tail_node.data).to eq 5
  end

  it 'Play with #insert_after #1' do
    list.insert_last(node5)
    node5 = list.find_node_by_value(5)
    expect(node5.data).to eq 5
    list.insert_after(node5, node6)
    expect(list.display_forward).to eq [5, 6]
    expect(list.head_node.data).to eq 5
    expect(list.tail_node.data).to eq 6
  end

  it 'Play with #insert_after #2' do
    list.insert_last(node5)
    list.insert_last(node7)
    node5 = list.find_node_by_value(5)
    list.insert_after(node5, node6)
    expect(list.display_forward).to eq [5, 6, 7]
  end

  it 'Play with #delete #1' do
    list.insert_last(node5)
    list.insert_last(node7)
    node5 = list.find_node_by_value(5)
    list.delete(node5)
    expect(list.display_forward).to eq [7]
    expect(list.head_node.data).to eq 7
    expect(list.tail_node.data).to eq 7
  end

  it 'Play with #delete #2' do
    list.insert_last(node5)
    list.insert_last(node7)
    node7 = list.find_node_by_value(7)
    list.delete(node7)
    expect(list.display_forward).to eq [5]
    expect(list.head_node.data).to eq 5
    expect(list.tail_node.data).to eq 5
  end

  it 'Play with #delete #3' do
    list.insert_last(node5)
    list.insert_last(node6)
    list.insert_last(node7)
    node6 = list.find_node_by_value(6)
    list.delete(node6)
    expect(list.display_forward).to eq [5, 7]
    expect(list.head_node.data).to eq 5
    expect(list.tail_node.data).to eq 7
  end
end

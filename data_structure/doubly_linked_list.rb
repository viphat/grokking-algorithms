# Doubly Linked List Implement
require 'pry'
# load './data-structure/doubly_linked_list.rb'
# rubocop:disable all
module DoublyLinkedList

  class List
    attr_accessor :head_node, :tail_node

    def initialize
      @head_node = nil
      @tail_node = nil
    end

    def display_forward
      res = []
      node = @head_node
      until node.nil?
        res.push node.data
        node = node.next_node
      end
      res
    end

    def display_backward
      res = []
      node = @tail_node
      until node.nil?
        res.push node.data
        node = node.prev_node
      end
      res
    end

    def insert_first(node)
      # Set Tail Node
      if @head_node.nil? && @tail_node.nil?
        @tail_node = node
        @tail_node.next_node = nil
      end

      # Swap Head Node
      tmp_node = @head_node
      @head_node = node
      node.next_node = tmp_node
      node.prev_node = nil
      true
    end

    def delete_first
      return if @head_node.nil?
      tmp_node = @head_node.next_node
      @head_node.next_node = nil
      tmp_node.prev_node = nil unless tmp_node.nil?
      @head_node = tmp_node
      @tail_node =
      if @tail_node.nil? && tmp_node.next_node.nil?
        tmp_node
      elsif @head_node.nil?
        @head_node
      else
        @tail_node
      end
    end

    def insert_last(node)
      return insert_first(node) if @tail_node.nil? && @head_node.nil?
      @tail_node.next_node = node
      node.prev_node = @tail_node
      @tail_node = node
    end

    def delete_last
      return delete_first if @tail_node == @head_node
      new_tail_node = @tail_node.prev_node
      new_tail_node.next_node = nil
      @tail_node = new_tail_node
    end

    def insert_after(node, new_node)
      # Insert after node
      current_node = @head_node

      until current_node.nil?
        if (current_node == node)
          tmp_node = current_node.next_node
          new_node.prev_node = current_node
          new_node.next_node = tmp_node
          if current_node.next_node.nil?
            @tail_node = new_node
          end
          current_node.next_node = new_node
          break
        else
          current_node = current_node.next_node
        end
      end
    end

    def delete(node)
      # Delete current_node
      current_node = head_node
      until current_node.nil?
        if (current_node == node)
          prev_node = current_node.prev_node
          next_node = current_node.next_node

          if prev_node.nil?
            @head_node = next_node
          else
            prev_node.next_node = next_node
          end

          if next_node.nil?
            @tail_node = prev_node
          else
            next_node.prev_node = prev_node
          end

          break
        else
          current_node = current_node.next_node
        end
      end
    end

    def find_node_by_value(value)
      # Returns First Element that meet condition
      node = head_node
      until node.nil?
        return node if node.data == value
        node = node.next_node
      end
      nil
    end
  end

  class Node
    attr_accessor :data, :next_node, :prev_node
    def initialize(data, next_node = nil, prev_node = nil)
      @next_node = next_node
      @prev_node = prev_node
      @data = data
    end
  end
end


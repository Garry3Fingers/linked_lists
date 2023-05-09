# frozen_string_literal: true

require_relative 'node'

# This class represents the full list
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    return prepend(value) if @head.nil?

    temp = @head
    temp = temp.next_node until temp.next_node.nil?
    temp.next_node = Node.new(value)
  end

  def prepend(value)
    return @head = Node.new(value) if head.nil?

    temp = @head
    @head = Node.new(value, temp)
  end

  def size(size = 0, accum = @head)
    return size if accum.nil?

    size(size + 1, accum.next_node)
  end

  def at(index, accum = @head, num = 0)
    return 'Node doesn\'t exist!' if index > size - 1 || accum.nil?
    return accum if num == index

    at(index, accum.next_node, num + 1)
  end

  def pop
    return 'Cannot delete!' if head.nil?
    return @head = nil if @head.next_node.nil?

    temp = @head
    until temp.next_node.nil?
      current_node = temp
      temp = temp.next_node
    end
    (current_node.next_node = nil)
  end

  def contains?(value)
    temp = @head
    until temp.nil?
      return true if temp.value == value

      temp = temp.next_node
    end
    false
  end

  def find(value)
    temp = @head
    i = 0
    until temp.nil?
      return i if temp.value == value

      i += 1
      temp = temp.next_node
    end
    nil
  end

  def to_s
    temp = @head
    string = ''
    until temp.nil?
      string = string.dup.concat("(#{temp.value}) -> ")
      temp = temp.next_node
    end
    string.dup.concat('nil')
  end

  def insert_at(value, index)
    if index > size - 1
      append(value)
    elsif index.zero?
      prepend(value)
    else
      arr_node = traversing_two_nodes(index)
      temp = Node.new(value, arr_node[1])
      arr_node[0].next_node = temp
    end
  end

  def remove_at(index)
    return "Node doesn\'t exist at index #{index}" if index > size - 1

    arr_node = traversing_two_nodes(index)
    arr_node[0].next_node = arr_node[1].next_node
  end

  def tail(accum = @head)
    return accum if accum.nil? || accum.next_node.nil?

    tail(accum.next_node)
  end

  private

  def traversing_two_nodes(index)
    i = 0
    current_node = @head
    next_node = @head.next_node
    while i + 1 < index
      i += 1
      current_node = current_node.next_node
      next_node = next_node.next_node
    end
    [current_node, next_node]
  end
end

# frozen_string_literal: true

require_relative 'node'

# This class represents the full list
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      prepend(value)
    else
      temp = @head
      temp = temp.next_node until temp.next_node.nil?
      temp.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if head.nil?
      @head = Node.new(value)
    else
      temp = @head
      @head = Node.new(value, temp)
    end
  end

  def size
    size = 0
    return size if @head.nil?

    temp = @head
    until temp.nil?
      size += 1
      temp = temp.next_node
    end
    size
  end

  def at(index)
    return 'Node doesn\'t exist!' if index > size - 1 || @head.nil?

    temp = @head
    i = 0
    while i < index
      temp = temp.next_node
      i += 1
    end
    temp
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
    if index > size - 1
      "Node doesn\'t exist at index #{index}"
    else
      arr_node = traversing_two_nodes(index)
      arr_node[0].next_node = arr_node[1].next_node
    end
  end

  def tail
    temp = @head
    temp = temp.next_node until temp.next_node.nil?
    temp
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

linked_list = LinkedList.new
linked_list.prepend({ name: 'Valdislav', age: 29 })
linked_list.append({ name: 'Anastasia', age: 24 })
linked_list.append({ name: 'Aleksandr', age: 30 })
linked_list.insert_at({ name: 'Ludmila', age: 21 }, 0)
puts linked_list.to_s
linked_list.insert_at({ name: 'Victor', age: 65 }, 2)
puts linked_list.to_s
linked_list.remove_at(4)
linked_list.pop
p linked_list.tail

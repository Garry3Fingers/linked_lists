# frozen_string_literal: true

# This class represents the full list
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head.nil?
      prepend(value)
    else
      temp = @head
      temp = temp.next_node until temp.next_node.nil?
      temp.next_node = Node.new(value)
      @tail = temp.next_node
    end
  end

  def prepend(value)
    @head = Node.new(value)
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
    current_node.next_node = nil
    @tail = current_node if size > 1
    @tail = nil if size == 1
  end
end

# This class represents one element of the list
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

linked_list = LinkedList.new
# p linked_list.at(1)
# puts linked_list.size
linked_list.prepend({ name: 'Valdislav', age: 29 })
# p linked_list.head.next_node
linked_list.append({ name: 'Anastasia', age: 24 })
# puts linked_list.tail.value[:name]
# p linked_list.tail.next_node
linked_list.append({ name: 'Aleksandr', age: 30 })
# puts linked_list.tail.value[:name]
# p linked_list.tail.next_node
# puts linked_list.head.next_node.value[:name]
# puts linked_list.size
# p linked_list.at(1)
# linked_list.pop
# puts linked_list.size
# p linked_list.tail
# linked_list.pop
# puts linked_list.size
# p linked_list.tail
# p linked_list.head
# linked_list.pop
# puts linked_list.size
# p linked_list.tail
# p linked_list.head
# p linked_list.pop

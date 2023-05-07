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
      tmp = @head
      tmp = tmp.next_node until tmp.next_node.nil?
      tmp.next_node = Node.new(value)
      @tail = tmp.next_node
    end
  end

  def prepend(value)
    @head = Node.new(value)
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
linked_list.prepend({ name: 'Valdislav', age: 29 })
# p linked_list.head.next_node
linked_list.append({ name: 'Anastasia', age: 24 })
# puts linked_list.tail.value[:name]
# p linked_list.tail.next_node
linked_list.append({ name: 'Aleksandr', age: 30 })
puts linked_list.tail.value[:name]
p linked_list.tail.next_node
puts linked_list.head.next_node.value[:name]

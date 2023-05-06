# frozen_string_literal: true

# This class represents the full list
class LinkedList
  def initialize
    @head = nil
    @tail = nil
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

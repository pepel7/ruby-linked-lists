class LinkedList
  attr_reader :head

  def prepend(value)
    @head = Node.new(value, @head)
    self
  end

  def append(value)
    temp = head
    temp = temp.next_node until temp.next_node.nil?
    temp.next_node = Node.new(value)
    self
  end

  def size
    temp = head
    count = 0
    until temp.nil?
      temp = temp.next_node
      count += 1
    end
    count
  end

  def tail
    temp = head
    temp = temp.next_node until temp.next_node.nil?
    temp
  end

  def at(index)
    temp = head
    index.times do
      temp = temp.next_node
    end
    temp.value
  end

  def pop
    temp = head
    temp = temp.next_node until temp.next_node.next_node.nil?
    popped = temp.next_node
    temp.next_node = nil
    popped
  end

  def contains?(value)
    temp = head
    until temp.nil?
      return true if temp.value == value

      temp = temp.next_node
    end
    false
  end

  def find(value)
    temp = head
    index = 0
    until temp.nil?
      return index if temp.value == value

      temp = temp.next_node
      index += 1
    end
  end

  def to_s
    temp = head
    string = ''
    until temp.nil?
      string += "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    string + 'nil'
  end

  private

  attr_writer :head
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

p test_list = LinkedList.new
puts test_list

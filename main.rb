class LinkedList
  attr_reader :head

  def prepend(value)
    @head = Node.new(value, @head)
    self
  end

  def append(value)
    return prepend(value) if size.zero?

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
    return nil if size.zero?

    temp = head
    temp = temp.next_node until temp.next_node.nil?
    temp
  end

  def at(index)
    return nil if index >= size

    temp = head
    index.times do
      temp = temp.next_node
    end
    temp.value
  end

  def pop
    return 'error: the list is empty' if size.zero?

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

  def insert_at(value, index)
    return 'error: the list is shorter than the given index' if index > size
    return prepend(value) if index.zero?
    return append(value) if index == size

    temp = head
    (index - 1).times do
      temp = temp.next_node
    end
    rest = temp.next_node
    temp.next_node = Node.new(value, rest)
    self
  end

  def remove_at(index)
    return 'error: the list is shorter than the given index' if index >= size
    return 'error: there is nothing to remove in the list' if size.zero?
    return pop(index) if index == size - 1

    temp = head
    (index - 1).times do
      temp = temp.next_node
    end
    rest = temp.next_node.next_node
    temp.next_node = rest
    self
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

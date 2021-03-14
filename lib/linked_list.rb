# frozen_string_literal: true

# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node
  attr_accessor :previous

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
    @previous = previous
  end
end

# Defines the singly linked list
class LinkedList
  def initialize
    @head = nil # keep the head private. Not accessible outside this class
    @tail = nil
  end

  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  # Time Complexity:O(1)
  # Space Complexity:O(1)
  def add_first(value)
    if @head.nil?
      @head = @tail = Node.new(value)
    else
      new_node = Node.new(value, @head)
      @head = new_node
    end
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def search(value)
    return false if @head.nil?

    current = @head
    return true if current.data == value

    while (current = current.next)
      return true if current.data == value
    end
    false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  def find_max
    return nil if @head.nil?

    max = @head.data
    current = @head

    while (current = current.next)
      max = current.data if current.data > max
    end

    max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def find_min
    return nil if @head.nil?

    min = @head.data
    current = @head
    while (current = current.next)
      min = current.data if current.data < min
    end
    min
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def length
    return 0 if @head.nil?

    count = 1
    current = @head

    while (current = current.next)
      count += 1
    end
    count
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def get_at_index(index)
    return nil if @head.nil?

    current = @head
    index.times do
      current = current.next
    end
    current.data
  end

  # method to print all the values in the linked list
  # Time Complexity: ?
  # Space Complexity: ?
  def visit
    return nil if @head.nil?

    current = @head
    print @head.data.to_s + '-->'
    while (current = current.next)
      print current.data.to_s + '-->'
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def delete(value)
    return false if @head.nil?

    current = @head
    if current.data == value
      @head = current.next
    else
      until current.next.nil?
        if current.next.data == value
          current.next = current.next.next
          return
        end
        current.next.next = nil if current.next.next == @tail && current.next.next.data == value
        current = current.next
      end
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: o(n)
  # Space Complexity: O(n)
  # def reverse
  #   current = @head
  #   while current != nil
  #     temp = current.previous
  #     current.previous = current.next
  #     current.next = temp
  #     current = current.previous
  #   end
  #   temp = @head
  #   @head = @tail
  #   @tail = temp
  # end

  def reverse
    current = @head
    previous = nil
    while current != nil
      temp = current.next # save state
      current.next = previous # update the link
      previous =  current
      current = temp
    end
    @head = previous
  end


  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: ?
  # Space Complexity: ?
  def find_middle_value
    raise NotImplementedError
    ​
    # slowPointer = @head
    # fastPointer = @head
    ​
    # if @head !=nil
    #     while (fastPointer !=nil && fastPointer.next !=nil)
    #         fastPointer = fastPointer.next.next
    #         slowPointer = slowPointer.next
    #     end
    # end
    #     # print("The middle element is: ", slow_ptr.data)
    #     slowPointer.data
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: ?
  # Space Complexity: ?
  def find_nth_from_end(n)
    raise NotImplementedError
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: ?
  # Space Complexity: ?
  def has_cycle
    raise NotImplementedError
  end

  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: ?
  # Space Complexity: ?
  def get_first
    @head ? @head.data : nil
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def add_last(value)
    new_node = Node.new(value)
    if @head.nil?
      add_first(new_node.data)
      return
    end
    current = @head
    current = current.next until current.next.nil?
    current.next = new_node
    new_node.next = nil
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def get_last
    return nil if @head.nil?

    current = @head
    current = current.next until current.next.nil?
    current.data
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity: ?
  # Space Complexity: ?
  def insert_ascending(value)
    raise NotImplementedError
  end

  # Helper method for tests
  # Creates a cycle in the linked list for testing purposes
  # Assumes the linked list has at least one node
  def create_cycle
    return if @head.nil? # don't do anything if the linked list is empty

    ​
    # navigate to last node
    current = @head
    current = current.next until current.next.nil?
    ​
    current.next = @head # make the last node link to first node
  end
end

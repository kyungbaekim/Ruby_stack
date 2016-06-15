class SLLNode
  attr_accessor :value, :next_node
  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class SLL
  attr_reader :head, :current, :current_nodes, :current_values
  def initialize
    @head = nil
    @current_nodes = []
    @current_values = []
  end

  def add(val)
    if @head == nil
      @head = SLLNode.new(val)
      puts "Given number(#{val}) added to SLL"
    else
      current = @head
      while current.next_node
        current = current.next_node
      end
      current.next_node = SLLNode.new(val)
      puts "Given number(#{val}) added to SLL"
    end
    self
  end

  def insert(val, previousVal)
    current = @head
    while current
      if current.value == previousVal
        temp = current.next_node
        current.next_node = SLLNode.new(val)
        current.next_node.next_node = temp
        return self
      end
      current = current.next_node
    end
    self
  end

  def find(val)
    current = @head
    while current
      if current.value == val
        puts "The number(#{val}) was found."
        return true
      end
      current = current.next_node
    end
    puts "The number(#{val}) was not found."
    return nil
  end

  def remove(val)
    if @head.value == val
      @head = @head.next_node
      return self
    else
      current = @head
      while current.next_node
        if current.next_node.value == val
          puts "The number(#{val}) was found."
          current.next_node = current.next_node.next_node
          puts "The number(#{val}) was removed."
          return self
        end
        current = current.next_node
      end
      puts "The number(#{val}) was not found."
      return nil
    end
  end

  def display_nodes
    @current_nodes.clear
    current = @head
    while current
      @current_nodes << current.inspect
      current = current.next_node
    end
    return @current_nodes
  end

  def display_values
    @current_values.clear
    current = @head
    while current
      @current_values << current.value
      current = current.next_node
    end
    return @current_values
  end

  def removeAll
    @head = nil
  end

  def min
    @min = @head.value
    current = @head
    while current
      if current.value < @min
        @min = current.value
      end
      current = current.next_node
    end
    @min
  end

  def max
    @max = @head.value
    current = @head
    while current
      if current.value > @max
        @max = current.value
      end
      current = current.next_node
    end
    @max
  end

  def how_many
    return self.display_values.count
  end
end

class Stack
  attr_reader :data_store, :back
  def initialize
    @data_store = []
    @back = 0
  end

  def push(val)
    @data_store << val
    @back = val
  end

  def pop
    if @data_store.empty?
      return nil
    else
      temp = @data_store.last
      @data_store.delete_at(@data_store.length - 1)
      @back = @data_store[@data_store.length - 1]
      return temp
    end
  end
end

# stack1 = Stack.new
# stack1.push(2)
# stack1.push(4)
# stack1.push(1)
# puts stack1.data_store.to_s
# puts stack1.back
# puts stack1.data_store.length
# stack1.pop
# puts stack1.data_store.to_s
# puts stack1.back

class Queue
  attr_reader :data_store, :back, :max, :min
  def initialize
    @data_store = []
    @back = 0
  end

  def enqueue(val)
    @data_store << val
    @back = val
  end

  def dequeue
    if @data_store.empty?
      return nil
    else
      temp = @data_store.first
      i = 0
      begin
        @data_store[i] = @data_store[i + 1]
        i += 1
      end while i < @data_store.length - 1
      @data_store.delete_at(@data_store.length - 1)
      return temp
    end
  end

  def find_min_max
    @min = @data_store[0]
    @max = @data_store[0]
    i = 1
    begin
      if @data_store[i] < @min
        @min = @data_store[i]
      end
      if @data_store[i] > @max
        @max = @data_store[i]
      end
      i += 1
    end while i < @data_store.length
  end
end

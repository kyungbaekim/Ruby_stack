require_relative 'queue'

RSpec.describe Queue do
  before do
    @queue = Queue.new
  end

  it 'checks if it has attributes of data_store and back after initialization' do
    expect(@queue.data_store).to eq([])
    expect(@queue.back).to eq(0)
  end

  it 'checks if user can set back attribute' do
    if expect {@queue.back = 10}.to raise_error(NoMethodError)
      puts "You cannot change BACK value!"
    else
      puts "Warning: No error raised!"
    end
  end

  it 'checks if enqueue method append values at the end of the array' do
    @queue.enqueue(2)
      expect(@queue.back).to eq(2)
      expect(@queue.data_store).to eq([2])
    @queue.enqueue(4)
      expect(@queue.back).to eq(4)
      expect(@queue.data_store).to eq([2, 4])
  end

  it 'checks if pop method removes the last value of the queue' do
    @queue.enqueue(2)
    @queue.enqueue(4)
    @queue.dequeue
    expect(@queue.data_store).to eq([4])
    @queue.dequeue
    expect(@queue.dequeue).to eq(nil)
  end

  it 'checks if max and min values get updated as values added or removed' do
    @queue.enqueue(2)
    @queue.enqueue(4)
    @queue.enqueue(1)
    @queue.enqueue(22)
    @queue.find_min_max
    expect(@queue.min).to eq(1)
    expect(@queue.max).to eq(22)
    @queue.dequeue
    @queue.dequeue
    @queue.dequeue
    @queue.enqueue(42)
    @queue.find_min_max
  end
end

require_relative 'sll'

RSpec.describe SLL do
  before do
    @sll = SLL.new
  end

  it 'checks if Node has attributes of value and next_node' do
    @sll.add(2)
    current = @sll.head
      expect(current.value).to eq(2)
      expect(current.next_node).to eq(nil)
    puts current.value
    current.next_node = SLLNode.new(5)
      expect(current.next_node.value).to eq(5)
      expect(current.next_node.next_node).to eq(nil)
  end

  it 'checks if initialize method in SLL creates a head attribute which refers to the first node' do
    expect(@sll.head).to eq(nil)
  end

  it 'checks if insert method inserts value at the right position' do
    @sll.add(2).add(5).add(1).add(10).add(3)
    puts @sll.display_values.to_s
    @sll.insert(4, 5)
    puts @sll.display_values.to_s
    expect(@sll.display_values).to eq([2, 5, 4, 1, 10, 3])
    @sll.insert(12, 0)
    expect(@sll.display_values).to eq([2, 5, 4, 1, 10, 3])
  end

  it 'checks if find method finds the given value in SLL' do
    @sll.add(2).add(5).add(1).add(10).add(3)
    expect(@sll.find(10)).to eq(true)
    expect(@sll.find(11)).to eq(nil)
  end

  it 'checks if remove method removes given value from SLL' do
    @sll.add(2).add(5).add(1).add(10).add(3).remove(2)
    expect(@sll.display_values).to eq([5, 1, 10, 3])
    expect(@sll.remove(12)).to eq(nil)
  end

  it 'checks if removeAll method removes all values from SLL' do
    @sll.add(2).add(5).add(1).add(10).add(3)
    expect(@sll.display_values).to eq([2, 5, 1, 10, 3])
    @sll.removeAll
    expect(@sll.display_values).to eq([])
  end

  it 'checks if min and max methods returns min and max values in SLL' do
    @sll.add(2).add(5).add(1).add(10).add(3)
    expect(@sll.min).to eq(1)
    expect(@sll.max).to eq(10)
  end

  it 'checks if how_many methods returns the count of nodes in SLL' do
    @sll.add(2).add(5).add(1).add(10).add(3)
    expect(@sll.how_many).to eq(5)
  end
end

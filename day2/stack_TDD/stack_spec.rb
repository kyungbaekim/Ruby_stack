require_relative 'stack'

RSpec.describe Stack do
  before do
    @stack = Stack.new
  end

  it 'checks if it has attributes of data_store and back after initialization' do
    expect(@stack.data_store).to eq([])
    expect(@stack.back).to eq(0)
  end

  it 'checks if user can set back attribute' do
    if expect {@stack.back = 10}.to raise_error(NoMethodError)
      puts "You cannot change BACK value!"
    else
      puts "Warning: No error raised!"
    end
  end

  it 'checks if push method append values at the end of the array' do
    @stack.push(2)
      expect(@stack.back).to eq(2)
    @stack.push(4)
      expect(@stack.back).to eq(4)
  end

  it 'checks if pop method removes the last value of the stack' do
    @stack.push(2)
    @stack.pop
    expect(@stack.pop).to eq(nil)
  end
end

require_relative 'apple_tree'

RSpec.describe Apple_Tree do
  before do
    @tree = Apple_Tree.new(1000, 3)
    @tree2 = Apple_Tree.new(90, 5)
    @tree3 = Apple_Tree.new(500, 1)
    @tree4 = Apple_Tree.new(700, 10)
  end

  it 'checks if it returns correct height, age and apple_count' do
    expect(@tree.height).to eq(1000)
    expect(@tree.age).to eq(3)
    expect(@tree.apple_count).to eq(0)
    expect(@tree2.apple_count).to eq(40)
  end
  
  it 'checks if the age affects its height and changes the count of apple on tree' do
    expect {@tree3.year_gone_by}.to change{@tree3.height}.from(@tree3.height).to(@tree3.height * 0.9)
    expect {@tree3.year_gone_by}.to_not change{@tree3.apple_count}
    @tree3.year_gone_by
    @tree3.year_gone_by
    @tree3.year_gone_by
    @tree3.year_gone_by
  end

  it 'checks if pick_apples method takes all apples from the apple tree' do
    @tree2.year_gone_by
    @tree2.year_gone_by
    @tree2.year_gone_by
    @tree2.year_gone_by
    expect {@tree2.pick_apples}.to change{@tree2.apple_count}.from(@tree2.apple_count).to(0)
    @tree2.year_gone_by
  end

  it 'checks if  apple tree decays and not grow apples after 10 years' do
    @tree4.year_gone_by
    expect {@tree4.year_gone_by}.to_not change{@tree4.apple_count}
  end
end

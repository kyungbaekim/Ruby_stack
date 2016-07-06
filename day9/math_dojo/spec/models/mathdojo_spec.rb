require 'spec_helper'
require_relative '../../app/models/mathdojo'

describe Mathdojo do
  it "adds" do
    expect(Mathdojo.new.add(3,8).result).to eq(11)
  end
  it "adds arrays" do
    expect(Mathdojo.new.add([1,3,5,9]).result).to eq(18)
  end
  it "subtracts" do
    expect(Mathdojo.new.subtract(3,4).result).to eq(-7)
  end
  it "subtracts arrays" do
    expect(Mathdojo.new.subtract([2,5]).result).to eq(-7)
  end
  it "mutiplies array" do
    expect(Mathdojo.new.add(1).multiply([3,5,7]).result).to eq(105)
  end
  it "mutiplies by the sum of array" do
    expect(Mathdojo.new.add(5).multiply_by_the_sum_of([3,5,7],3).result).to eq(90)
  end
  it "resets the result to 1" do
    expect(Mathdojo.new.add(5).subtract(3,5).reset.add(3).result).to eq(4)
  end
end

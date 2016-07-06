require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @tester = User.create(first_name:"Tester", last_name:"Tester", email:"test@test.com", password:"Tester")
  end
  it "should not allow invalid email format" do
    @writer1 = User.new(first_name:"Writer1", last_name:"Writer1", email:"write", password:"Writer1")
    @writer2 = User.new(first_name:"Writer2", last_name:"Writer2", email:"write@write.com", password:"Writer2")
    expect(@writer1).to be_invalid
    expect(@writer2).to be_valid
  end
  it "should not allow duplicated email" do
    @writer = User.new(first_name:"Writer", last_name:"Writer", email:"test@test.com", password:"Writer")
    expect(@writer).to be_invalid
  end
  it "should require all first_name, last_name, email, password fields" do
    @writer1 = User.new(first_name:"", last_name:"", email:"", password:"")
    @writer2 = User.new(first_name:"Writer", last_name:"Writer", email:"write@write.com", password:"")
    @writer3 = User.new(first_name:"Writer", last_name:"Writer", email:"", password:"Writer")
    @writer4 = User.new(first_name:"Writer", last_name:"", email:"write@write.com", password:"Writer")
    @writer5 = User.new(first_name:"", last_name:"Writer", email:"write@write.com", password:"Writer")
    expect(@writer1).to be_invalid
    expect(@writer2).to be_invalid
    expect(@writer3).to be_invalid
    expect(@writer4).to be_invalid
    expect(@writer5).to be_invalid
  end
  it "should not allow password less than 6 characters" do
    @writer1 = User.new(first_name:"Writer", last_name:"Writer", email:"writer@writer.com", password:"Write")
    @writer2 = User.new(first_name:"Writer", last_name:"Writer", email:"writer@writer.com", password:"Writer")
    expect(@writer1).to be_invalid
    expect(@writer2).to be_valid
  end
end

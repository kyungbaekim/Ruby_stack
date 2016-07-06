require "spec_helper"
describe "routes for Dojos", :type => :routing do
  it "/ routes to the dojos controller and index method" do
    expect(:get => "/").to route_to("dojos#index")
  end
  it "/hello routes to the dojos controller and world method" do
    expect(:get => "/hello").to route_to("dojos#world")
  end
  it "/ninjas routes to the dojos controller and ninjas method" do
    expect(:get => "/ninjas").to route_to("dojos#ninjas")
  end
end

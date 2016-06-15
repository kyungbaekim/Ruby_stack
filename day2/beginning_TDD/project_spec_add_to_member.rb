require_relative 'project'

RSpec.describe Project do
  it 'has a method add_to_team to display member names' do
    #lets create two new projects
    project1 = Project.new("Students", "description 1")
    project2 = Project.new("Instructors", "description 2")
    #add copule members to projects
    expect(project1.add_to_team("KB")).to eq(["KB"])
    expect(project1.add_to_team("Tyler")).to eq(["KB", "Tyler"])
    expect(project2.add_to_team("Mike")).to eq(["Mike"])
    expect(project2.add_to_team("Kris")).to eq(["Mike", "Kris"])
  end
end

require_relative 'project'
# require 'stringio'

RSpec.describe Project do
  # before do
  #   $stdout = StringIO.new
  # end
  # after(:all) do
  #   $stdout = STDOUT
  # end

  it 'has a method elevator_pitch to explain name and description' do
    #lets create two new projects
    project1 = Project.new("Project 1", "description 1")
    project2 = Project.new("Project 2", "description 2")
    #if we call elevator_pitch method we should expect to get that project name and description back
    # project1.elevator_pitch
    #   expect($stdout.string).to match("Project 1, description 1")
    # project2.elevator_pitch
    #   expect($stdout.string).to match("Project 2, description 2")
    expect {project1.elevator_pitch}.to output("Project 1, description 1\n").to_stdout
    expect {project2.elevator_pitch}.to output("Project 2, description 2\n").to_stdout
  end
end

class Project
  attr_accessor :name, :description, :member
  def initialize(name, description)
    @name = name
    @description = description
    @member = []
  end

  def elevator_pitch
    puts "#{@name}, #{@description}"
  end

  def add_to_team(member_name)
    @member << member_name
  end
end

project1 = Project.new("Project 1", "description 1")
# project2 = Project.new("Project 2", "description 2")
# project1.elevator_pitch
# project2.elevator_pitch
# puts project1.add_to_team("KB")
# puts project1.add_to_team("Tyler")

require_relative 'solar_system'

RSpec.describe Solar_System do
  before do
    @galaxy = Solar_System.new
    @galaxy2 = Solar_System.new("Andromeda")
    @planet = Planet.new("Earth", "This is where we live", 7000000000)
    @planet2 = Planet.new("Mars", "This is where we will live", 0)
  end
  it 'checks if it returns correct name, description and population' do
    expect(@planet.name).to eq("Earth")
    expect(@planet.description).to eq("This is where we live")
    expect(@planet.population).to eq(7000000000)
  end

  it 'checks if the name of Solar_System assigned properly' do
    expect(@galaxy.system_name).to eq("Milky Way")
    expect(@galaxy2.system_name).to eq("Andromeda")
  end

  it 'checks if Solar_System class stores all planets in a list' do
    @planet.add_to_solar_system(@galaxy)
      expect(@galaxy.displayPlanets).to eq(["Earth"])
    @planet2.add_to_solar_system(@galaxy)
      expect(@galaxy.displayPlanets).to eq(["Earth", "Mars"])
  end

  it 'checks if Solar_System class keeps track of the count of planets added' do
    @planet.add_to_solar_system(@galaxy)
      expect(@galaxy.displayCount).to eq(1)
    @planet2.add_to_solar_system(@galaxy)
      expect(@galaxy.displayCount).to eq(2)
  end

  it 'checks if user only can add planets to Solar_System from the Planet class' do
    if expect {@galaxy.planets << "Jupitor"}.to raise_error(NoMethodError)
      puts "You can only add planet to solar_system from Planet class!"
    else
      puts "Warning: No error raised!"
    end
  end

  it 'checks if super_nova method deletes all planets in planets list' do
    @planet.add_to_solar_system(@galaxy)
    @planet2.add_to_solar_system(@galaxy)
    @galaxy.super_nova
      expect(@galaxy.displayPlanets).to eq([])
      expect(@galaxy.displayCount).to eq(0)
  end
end

require_relative 'wizard'

RSpec.describe Wizard do
  before do
    @wizard = Wizard.new
    @human = Human.new
  end
  it 'checks for the default health and intelligence of wizard' do
    expect(@wizard.health).to eq(50)
    expect(@wizard.intelligence).to eq(25)
  end

  it 'has a method heal that increases the health of wizard by 10' do
    expect {@wizard.heal}.to change{@wizard.health}.from(50).to(60)
  end

  it 'checks if the ancestor chain that includes Human' do
    expect(@wizard.class.ancestors.include? Human).to eq(true)
  end

  it 'has a method heal that increases the health of wizard by 10' do
    expect {@wizard.fireball(@human)}.to change{@human.health}.from(100).to(80)
  end
end

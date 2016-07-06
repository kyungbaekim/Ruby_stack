require "spec_helper"
require "rails_helper"

describe "Ninja_Features" do
  it "prompts for the ninja fields" do
    visit "/ninjas"
    expect(page).to have_field('ninja[name]')
    expect(page).to have_field('ninja[description]')
  end
  it "creates ninja and redirects to success page" do
    visit "/ninjas"
    fill_in "ninja[name]", with: "Michael Choi"
    fill_in "ninja[description]", with: "The founder"
    click_button "Submit"
    expect(current_path).to eq("/ninjas/success")
    expect(page).to have_text("success")
  end
  it "should display error message when form data is empty" do
    visit "/ninjas"
    fill_in "ninja[name]", with: ""
    fill_in "ninja[description]", with: ""
    click_button "Submit"
    expect(current_path).to eq("/ninjas")
    expect(page).to have_text("Sorry")
    expect(page).to have_text("Name can't be blank")
    expect(page).to have_text("Description can't be blank")
  end
  it "should display error message when length of name is < 5 and length of description is < 10" do
    visit "/ninjas"
    fill_in "ninja[name]", with: "test"
    fill_in "ninja[description]", with: "test"
    click_button "Submit"
    expect(current_path).to eq("/ninjas")
    expect(page).to have_text("Sorry")
    expect(page).to have_text("Name is too short")
    expect(page).to have_text("Description is too short")
  end
end

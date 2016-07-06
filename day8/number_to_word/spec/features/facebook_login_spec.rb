require 'spec_helper'
require 'rspec-rails'
describe "Facebook", :type => :feature do
  it "lets user to login", :js => true do
    visit('http://facebook.com')
    fill_in('email', :with => 'userdemo734@yahoo.com.ph')
    fill_in('pass', :with => 'qwerty12345')
    click_link_or_button('Log In')
  end
end

require 'rails_helper'
RSpec.describe 'user profile page' do
  before do
    @user = create_user
    log_in @user
  end
  it "displays a user's posts on profile page" do
    post = @user.posts.create(content: 'post')
    visit "/users/#{@user.id}"
    expect(page).to have_text("#{post.content}")
  end
  it "displays everyone's posts" do
    user2 = create_user 'julius', 'julius@lakers.com'
    post1 = @user.posts.create(content: 'post')
    post2 = user2.posts.create(content: 'post')
    visit '/posts'
    expect(page).to have_text(post1.content)
    expect(page).to have_text(post2.content)
  end
end

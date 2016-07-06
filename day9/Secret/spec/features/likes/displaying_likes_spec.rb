require 'rails_helper'
RSpec.describe 'displaying likes' do
  before do
    @user = create_user
    log_in @user
    @post = @user.posts.create(content: 'Oops')
    Like.create(user: @user, post: @post)
  end
  it 'displays amount of likes next to each post' do
    visit '/posts'
    expect(page).to have_text(@post.content)
    expect(page).to have_text('1 likes')
    visit "/users/#{@user.id}"
    expect(page).to have_text(@post.content)
    expect(page).to have_text('1 likes')
  end
end

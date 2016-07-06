require 'rails_helper'
RSpec.describe 'displaying likes' do
  before do
    @user = create_user
    log_in @user
    @post1 = @user.posts.create(content: 'Oops')
    @post2 = @user.posts.create(content: 'I did it again')
    Like.create(user: @user, post: @post1)
  end
  it 'displays unlike button for posts already liked' do
    visit '/posts'
    expect(page).to have_text(@post1.content)
    expect(page).to have_text('1 likes')
    expect(page).to have_button('Unlike')
    expect(page).to have_text(@post2.content)
    expect(page).to have_text('0 likes')
    expect(page).to have_button('Like')
  end
  it 'deletes like and displays the changes in both profile and posts page' do
    visit '/posts'
    click_button 'Unlike'
    expect(current_path).to eq("/posts")
    expect(page).not_to have_button('Unlike')
    expect(page).not_to have_text('1 likes')
    visit "/users/#{@user.id}"
    expect(page).not_to have_text('1 likes')
  end
  it 'creates like and displays it both in profile and posts page' do
    visit '/posts'
    click_button 'Like'
    expect(current_path).to eq('/posts')
    expect(page).not_to have_button('Like')
    expect(page).not_to have_text('0 likes')
    visit "/users/#{@user.id}"
    expect(page).not_to have_text('0 likes')
  end
end

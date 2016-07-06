require 'rails_helper'
RSpec.describe Post, type: :model do
  it 'requires content' do
    post = Post.new
    post.valid?
    expect(post.errors[:content].any?).to eq(true)
  end
  describe 'relationships' do
    it 'belongs to a user' do
      user = create_user
      post = user.posts.create(content: 'post 1')
      expect(post.user).to eq(user)
    end
    it 'has many likes' do
      user1 = create_user
      user2 = create_user 'julius', 'julius@lakers.com'
      post = user1.posts.create(content: 'post 1')
      like1 = Like.create(user: user1, post: post)
      like2 = Like.create(user: user2, post: post)
      expect(post.likes).to include(like1)
      expect(post.likes).to include(like2)
    end
  end
end

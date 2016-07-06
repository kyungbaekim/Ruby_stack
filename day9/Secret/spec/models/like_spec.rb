require 'rails_helper'
RSpec.describe Like, type: :model do
  describe 'relationships' do
    before do
      @user = create_user
      @post = @user.posts.create(content: 'Oops')
      @like = Like.create(user: @user, post: @post)
    end
    it 'belongs to a user' do
      expect(@like.user).to eq(@user)
    end
    it 'belongs to a secret' do
      expect(@like.post).to eq(@post)
    end
  end
end

require 'rails_helper'
RSpec.describe LikesController, type: :controller do
  before do
    @user = create_user
    @post = @user.posts.create(content: "secret")
  end
  describe "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot like the post" do
      post :update, like = 'like', post_id: @post.id
      expect(response).to redirect_to('/sessions/new')
    end
    it "cannot dislike the post" do
      post :update, like = 'unlike', post_id: @post.id
      expect(response).to redirect_to('/sessions/new')
    end
  end
  describe "when signed in as the wrong user" do
    before do
      @wrong_user = create_user 'julius', 'julius@lakers.com'
      session[:user_id] = @wrong_user.id
      @post = @user.posts.create(content: 'Ooops')
    end
    it "cannot access like" do
      post :update, like = 'like', post_id: @post.id, id: @user.id
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
  end
end

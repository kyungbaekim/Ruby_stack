class LikesController < ApplicationController
  before_action :require_login
  before_action :require_correct_user

  def update
    post = Post.find(params[:post_id])
    if params[:like] == 'like'
      Like.create(user: current_user, post: post)
    else
      @user = User.find(session[:user_id])
      @user.likes.find_by(post_id: params[:post_id]).destroy
    end
    redirect_to '/posts'
  end
end

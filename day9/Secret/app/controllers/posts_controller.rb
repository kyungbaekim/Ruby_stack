class PostsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]

  def index
    @user = User.find(session[:user_id])
    @posts = Post.all
    @likes = Like.all
    render '/posts/index'
  end

  def show
  end

  def create
    @user = User.find(session[:user_id])
    if @user.posts.create(content: params[:post][:content])
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def edit
  end

  def new
  end

  def update
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user == current_user
    redirect_to "/users/#{current_user.id}"
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end

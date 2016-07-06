class UsersController < ApplicationController
  def index
    if !session[:user_name]
      render 'users/index'
    else
      # render 'users/main'
      redirect_to url_for(:controller => :users, :action => :main)
    end
  end

  def login
    user_info = params[:user]
    user = User.find_by(name: user_info[:name])
    if user
      if user_info[:password] == user.password
        session[:user_name] = user.name
        session[:user_id] = user.id
        flash[:success] = 'User found so logging in!'
        puts 'User logged in!'
        redirect_to url_for(:controller => :users, :action => :main)
      else
        flash[:fail] = 'The password is incorrect!'
        redirect_to url_for(:controller => :users, :action => :index)
      end
    else
      user = User.create(name: user_info[:name], password: user_info[:password])
      session[:user_name] = user.name
      session[:user_id] = user.id
      puts 'User not found so added to DB!'
      redirect_to url_for(:controller => :users, :action => :main)
    end
  end

  def logout
    session.delete(:user_name)
    session.delete(:user_id)
    redirect_to url_for(:controller => :users, :action => :index)
  end

  def main
    @post_data = []
    @comment_data = []
    posts = Post.includes(:user)
    posts.each do |post|
      @post_data.push({poster: post.user.name, post: post.post, post_id: post.id, created_at: post.created_at})
    end
    comments = Comment.includes(:user)
    puts comments
    comments.each do |comment|
      @comment_data.push({commenter: comment.user.name, comment: comment.comment, post_id: comment.post_id, created_at: comment.created_at})
    end
    @post_data.reverse!
    @comment_data.reverse!
    render 'users/main'
  end

  def add_post
    post = Post.create(post: params[:post], user_id: session[:user_id])
    if post
      redirect_to url_for(:controller => :users, :action => :main)
    end
  end

  def add_comment
    # render text: 'comment: ' + params[:comment] + ', post_id: ' + params[:post_id]
    comment = Comment.create(comment: params[:comment], user_id: session[:user_id], post_id: params[:post_id])
    if comment
      redirect_to url_for(:controller => :users, :action => :main)
    end
  end
end

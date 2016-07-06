class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    if session[:user_id]
      @user = User.find(params[:id])
      # @posts = Post.where(user_id: session[:user_id])
      @posts = Post.all
      # @likes = Like.all
      render '/users/show'
    else
      redirect_to '/sessions/new'
    end
  end

  def new
    render '/users/new'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      flash[:success] = 'You are successfully registered!'
      redirect_to "/users/#{@user.id}"
    else
      flash[:failed] = 'Sorry, invalid data! You must fill out all the fields below!'
      flash[:email] = @user.errors[:email]
      flash[:name] = @user.errors[:name]
      flash[:password] = @user.errors[:password]
      flash[:password_confirmation] = @user.errors[:password_confirmation]
      redirect_to '/users/new'
    end
  end

  def edit
    @user = User.find(params[:id])
    render '/users/edit'
  end

  def update
    @user = User.find_by(id: session[:user_id])
    if @user.update(name: params[:user][:name], email: params[:user][:email])
      session[:user] = {id: @user.id, name: @user.name, email: @user.email}
      flash[:success] = 'You are successfully updated!'
      redirect_to "/users/#{@user.id}"
    else
      flash[:failed] = 'Sorry, invalid data! We are missing some information!'
      flash[:email] = @user.errors[:email]
      flash[:name] = @user.errors[:name]
      # flash[:password] = @user.errors[:password]
      # flash[:password_confirmation] = @user.errors[:password_confirmation]
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def destroy
    if User.find_by(name: session[:user_name]).destroy
      session.delete(:user)
      redirect_to '/sessions/new'
    else
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end

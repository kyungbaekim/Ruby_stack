class UsersController < ApplicationController
  def index
    @users = User.all
    render '/users/index'
  end

  def new
    render '/users/new'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = 'User was successfully created!'
    else
      flash[:message] = 'Error occurred while saving new user!'
    end
    redirect_to '/users'
  end

  def show
    @user = User.find(params[:id])
    render '/users/show'
  end

  def edit
    @user = User.find(params[:id])
    render '/users/edit'
  end

  def update
    if User.update(params[:user][:id], user_params)
      flash[:message] = 'User was successfully updated!'
    else
      flash[:message] = 'Error occurred while updating user information!'
    end
    redirect_to '/users'
  end

  def destroy
    if User.destroy(params[:id])
      flash[:message] = 'User was successfully deleted!'
    else
      flash[:message] = 'Error occurred while deleting user information!'
    end
    redirect_to '/users'
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email_address, :password)
    end
end

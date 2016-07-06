class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.last
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/home'
    else
      redirect_to action: 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :description, :avatar)
    end
end

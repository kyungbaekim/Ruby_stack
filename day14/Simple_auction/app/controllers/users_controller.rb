class UsersController < ApplicationController
  def index
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      session[:username] = user.username
      redirect_to '/auctions'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :wallet, :password, :password_confirmation)
    end
end

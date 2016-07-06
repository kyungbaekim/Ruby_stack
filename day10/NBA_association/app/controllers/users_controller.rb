class UsersController < ApplicationController
  def index
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to '/nba'
    else
      flash[:errors] = {:email => user.errors[:email], :name => user.errors[:name], :password => user.errors[:password], :password_confirmation => user.errors[:password_confirmation]}
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

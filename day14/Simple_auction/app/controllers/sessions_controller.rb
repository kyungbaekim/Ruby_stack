class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def create
    user = User.find_by(:username => params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      session[:username] = user.username
      redirect_to '/auctions'
    else
      flash[:error] = "Invalid username or password"
      redirect_to :back
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:user_name)
    redirect_to :root
  end
end

class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(:email => params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to '/nba'
    else
      flash[:error] = "Invalid email or password"
      redirect_to :back
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:user_name)
    redirect_to '/login'
  end
end

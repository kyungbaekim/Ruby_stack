class SessionsController < ApplicationController
  def new
    render '/sessions/new'
  end

  def login
    @user = User.find_by(email: params[:session][:email])
    if !@user || !@user.authenticate(params[:session][:password])
      flash[:error] = 'Invalid email or password!'
      redirect_to '/sessions/new'
    else
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      flash[:success] = 'You are successfully logged in!'
      redirect_to "/users/#{@user.id}"
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:user_name)
    redirect_to '/sessions/new'
  end
end

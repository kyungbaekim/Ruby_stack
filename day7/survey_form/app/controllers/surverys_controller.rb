class SurverysController < ApplicationController
  def main
    if !session[:visit]
      session[:visit] = 0
    end
    render 'surverys/main'
  end

  def show
    @user = params[:user]
    session[:visit] += 1
    flash[:success] = "Thanks for submitting this form! You have submitted this form " + session[:visit].to_s + " times now."
    puts @user, flash[:success]
    render 'surverys/show'
  end
end

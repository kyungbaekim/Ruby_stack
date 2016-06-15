class NumbersController < ApplicationController
  def index
    num = Random.rand(1..100)
    if !session[:num]
      session[:num] = num
    end
  end

  def guess
    guess = params[:guess].to_i
    if guess == session[:num]
      flash[:flag] = 'good'
      flash[:message] = guess.to_s + ' was the number!'
    elsif guess > session[:num]
      flash[:flag] = 'bad'
      flash[:message] = 'Too high!'
    else
      flash[:flag] = 'bad'
      flash[:message] = 'Too low!'
    end
    redirect_to url_for(:controller => :numbers, :action => :index)
  end

  def new
    num = Random.rand(1..100)
    session[:num] = num
    redirect_to url_for(:controller => :numbers, :action => :index)
  end
end

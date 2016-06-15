class PracticesController < ApplicationController
  def index
    render text: 'What do you want me to say???'
  end
  def hello
    render text: 'Hello CodingDojo!'
  end
  def say
    render text: 'Saying Hello!'
  end
  def say_name
    render text: 'Saying Hello Joe!'
  end
  def say_michael
    redirect_to url_for(:controller => :practices, :action => :say_name)
  end
  def visit
    if session[:visit]
      session[:visit] += 1
    else
      session[:visit] = 0
    end
    render text: session[:visit]
  end
  def reset_visit
    session[:visit] = 0
    render text: 'Destroyed the session!'
  end
end

class RpgsController < ApplicationController
  def index
    if !session[:gold]
      session[:gold] = 0
    end
    if !session[:activities]
      session[:activities] = []
    end
    render 'rpgs/index'
  end

  def farm
    earn = Random.rand(10..20)
    time = Time.new
    time_stamp = time.strftime("%Y/%m/%d %I:%M %p")
    session[:gold] += earn
    session[:activities].push('Earned ' + earn.to_s + ' golds from the farm! (' + time_stamp + ')')
    redirect_to '/'
  end

  def cave
    earn = Random.rand(5..10)
    time = Time.new
    time_stamp = time.strftime("%Y/%m/%d %I:%M %p")
    session[:gold] += earn
    session[:activities].push('Earned ' + earn.to_s + ' golds from the cave! (' + time_stamp + ')')
    redirect_to '/'
  end

  def house
    earn = Random.rand(2..5)
    time = Time.new
    time_stamp = time.strftime("%Y/%m/%d %I:%M %p")
    session[:gold] += earn
    session[:activities].push('Earned ' + earn.to_s + ' golds from the house! (' + time_stamp + ')')
    redirect_to '/'
  end

  def casino
    time = Time.new
    time_stamp = time.strftime("%Y/%m/%d %I:%M %p")
    option = Random.rand(0..1)
    if option == 0
      earn = Random.rand(10..20)
      session[:gold] += earn
      session[:activities].push('Entered a casino and earned ' + earn.to_s + ' golds! (' + time_stamp + ')')
    else
      lose = Random.rand(10..20)
      session[:gold] -= lose
      session[:activities].push('Entered a casino and lost ' + lose.to_s + ' golds... Ouch... (' + time_stamp + ')')
    end
    redirect_to '/'
  end

  def destroy
    session.delete(:gold)
    session.delete(:activities)
    redirect_to '/'
  end
end

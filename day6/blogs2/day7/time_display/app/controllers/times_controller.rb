class TimesController < ApplicationController
  def main
    temp = Time.new
    @time = temp.strftime("%b %d, %Y\n%I:%M %p")
    render 'times/main'
  end
end

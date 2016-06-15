class WordsController < ApplicationController
  def index
    if !session[:count]
      session[:count] = 1
    else
      session[:count] += 1
    end

    @chr = ('A'..'Z').to_a + ('0'..'9').to_a
    @str = ''

    for i in 0..13
      @str += @chr[Random.rand(@chr.length)]
    end

    render 'words/index'
  end
end

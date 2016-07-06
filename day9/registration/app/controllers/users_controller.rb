class UsersController < ApplicationController
  def index
    render '/users/index'
  end

  def create
    redirect_to '/users'
  end
end

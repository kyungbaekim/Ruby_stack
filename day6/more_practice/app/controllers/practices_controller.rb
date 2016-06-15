class PracticesController < ApplicationController
  def index
    render json: User.all
  end
  def new
    render 'practices/new'
  end
  def show
    render json: User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
    render 'practices/edit'
  end
  def total
    render json: User.count
  end
  def create
    name = ["Olivia", "Sophia", "Emma", "Eva", "Harper", "Emiley", "Mia", "Abigail", "David", "Noah", "Enoch", "Adam", "Eve", "Cain", "Abel", "Solomon", "William", "Jacob", "James", "Michael"]
    @user = User.create(name:name[rand(0..20)])
    redirect_to url_for(:controller => :practices, :action => :index)
  end
end

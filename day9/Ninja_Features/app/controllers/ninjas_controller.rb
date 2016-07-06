class NinjasController < ApplicationController
  def index
    render '/ninjas/index'
  end

  def create
    ninja = Ninja.new(ninja_params)
    if ninja.save
      flash[:succeed] = 'Form submitted successfully!'
      redirect_to '/ninjas/success'
    else
      flash[:failed] = 'Sorry, failed to submit form. Please enter the required information!'
      flash[:name] = ninja.errors[:name]
      flash[:description] = ninja.errors[:description]
      flash[:errors] = ninja.errors.full_messages
      redirect_to '/ninjas'
    end
  end

  def success
    render '/ninjas/success'
  end

  private
    def ninja_params
      params.require(:ninja).permit(:name, :description)
    end
end

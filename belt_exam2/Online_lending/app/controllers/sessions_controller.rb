class SessionsController < ApplicationController
  def create
    borrower = Borrower.find_by(:email => params[:user][:email])
    lender = Lender.find_by(:lemail => params[:user][:email])
    if borrower && borrower.authenticate(params[:user][:password])
      session[:status] = 'borrower'
      session[:borrower_id] = borrower.id
      session[:borrower_name] = borrower.full_name
      redirect_to '/borrowers/' + borrower.id.to_s
    elsif lender && lender.authenticate(params[:user][:password])
      session[:status] = 'lender'
      session[:lender_id] = lender.id
      session[:lender_name] = lender.full_name
      redirect_to '/lenders/' + lender.id.to_s
    else
      flash[:error] = "Invalid email or password"
      redirect_to :back
    end
  end

  # def reset
  #   reset_session
  #   redirect_to '/login'
  # end

  def destroy
    reset_session
    redirect_to '/login'
  end
end

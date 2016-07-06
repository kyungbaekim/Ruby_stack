class BorrowersController < ApplicationController
  def index
  end

  def show
    @borrower = Borrower.find(params[:id])
    @lenders = History.where(borrower_id: session[:borrower_id]).group(:lender_id).joins(:lender)
  end

  def update
  end

  def create
    borrower = Borrower.new(borrower_params)
    if borrower.save
      session[:status] = 'borrower'
      session[:borrower_id] = borrower.id
      session[:borrower_name] = borrower.full_name
      redirect_to '/borrowers/' + borrower.id.to_s
    else
      flash[:borrower_errors] = borrower.errors.full_messages
      redirect_to :back
    end
  end

  private
    def borrower_params
      params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation, :purpose, :description, :money, :raised)
    end
end

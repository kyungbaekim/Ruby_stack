class LendersController < ApplicationController
  def index
  end

  def show
    @lender = Lender.find(params[:id])
    # @in_needs = Borrower.where('id NOT IN' (SELECT DISTINCT(lender_id) FROM histories)')
    # @in_needs = Borrower.where.not(id: Lender.find(session[:lender_id].to_s).borrowers.pluck(:id))
    @in_needs = Borrower.all
    @borrowed = History.where(lender_id: session[:lender_id]).group(:borrower_id).joins(:borrower)
    # @borrowed = Borrower.where(id: Lender.find(session[:lender_id].to_s).borrowers.pluck(:id)).joins(:histories)
  end

  def update
  end

  def create
    lender = Lender.new(lender_params)
    if lender.save
      session[:status] = 'lender'
      session[:lender_id] = lender.id
      session[:lender_name] = lender.full_name
      redirect_to '/lenders/' + lender.id.to_s
    else
      flash[:lender_errors] = lender.errors.full_messages
      redirect_to :back
    end
  end

  private
    def lender_params
      params.require(:lender).permit(:lfirst_name, :llast_name, :lemail, :password, :password_confirmation, :lmoney)
    end
end

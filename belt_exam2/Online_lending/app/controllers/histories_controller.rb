class HistoriesController < ApplicationController
  def create
    history = History.new(history_params)
    if history.save
      borrower = Borrower.find(params[:history][:borrower_id])
      borrower.increment(:raised, params[:history][:amount].to_i)
      borrower.save
      lender = Lender.find(params[:history][:lender_id])
      lender.increment(:lmoney, -(params[:history][:amount]).to_i)
      lender.save
      redirect_to '/lenders/' + session[:lender_id].to_s
    else
      flash[:error] = "Something went wrong while updating data."
      redirect_to :back
    end
  end

  private
    def history_params
      params.require(:history).permit(:lender_id, :borrower_id, :amount)
    end
end

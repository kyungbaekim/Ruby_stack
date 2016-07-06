class BidsController < ApplicationController
  def create
    bid = Bid.new(bid_params)
    if bid.save
      redirect_to '/auctions'
    else
      flash[:errors] = bid.errors.full_messages
      redirect_to :back
    end
  end

  private
    def bid_params
      params.require(:bid).permit(:bid, :auction_id, :user_id)
    end
end

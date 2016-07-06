class AuctionsController < ApplicationController
  before_action :require_login, only: [:index, :new, :create, :show, :destroy]

  def index
    @auctions = Auction.all
    @user = User.find(session[:user_id])
  end

  def new
  end

  def create
    auction = Auction.new(auction_params)
    if auction.save
      redirect_to '/auctions'
    else
      flash[:errors] = auction.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @bids = Bid.where(auction_id: params[:id])
  end

  def destroy
  end

  private
    def auction_params
      params.require(:auction).permit(:product_name, :description, :start_bid, :reserve_price, :end_date, :user_id)
    end
end

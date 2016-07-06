class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction
  validates :user_id, :auction_id, :bid, presence:true
  validates :bid, presence: true, numericality: { greater_than: 0 }
  validate :bid_less_than_wallet, :bid_higher_than_top_bid, :bid_higher_start_price

  def bid_less_than_wallet
    user = User.find(user_id)
    if self.bid && (self.bid > user.wallet)
      errors.add(:bid, "cannot exceed your wallet balance")
    end
  end

  def bid_higher_than_top_bid
    puts self
    if self.bid <= self.auction.top_bid
      errors.add(:bid, "cannot lower than the top bid")
    end
  end

  def bid_higher_start_price
    puts self
    if self.bid <= self.auction.start_bid
      errors.add(:bid, "cannot lower than the starting price")
    end
  end
end

class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :bids, dependent: :destroy
  validates :product_name, presence: true, length: { in: 3..20 }
  validates :description, :user_id, presence: true
  validates :start_bid, presence: true, numericality: { greater_than: 0 }
  validates :reserve_price, presence: true
  validate :end_date_a_future_date?

  def end_date_a_future_date?
    if end_date.present? && end_date.to_date < Date.today
      errors.add(:end_date, "cannot be a past date")
    end
  end

  def top_bid
    max = 0.0
    self.bids.each do |b|
      if (b.bid > max)
        max = b.bid
      end
    end
    return max
  end
end

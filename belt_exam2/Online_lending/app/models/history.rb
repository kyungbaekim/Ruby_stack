class History < ActiveRecord::Base
  belongs_to :lender
  belongs_to :borrower
  validates :lender_id, :borrower_id, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def amount_sum
    puts self
    history = History.where(lender_id: self.lender_id, borrower_id: self.borrower_id)
    sum = history.sum(:amount)
  end
end

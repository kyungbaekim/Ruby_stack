class User < ActiveRecord::Base
  has_secure_password
  has_many :bids, dependent: :destroy
  has_many :auctions, dependent: :destroy
  validates :first_name, :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :wallet, presence: true
  validates :username, presence: true, uniqueness: { :case_sensitive => false }, length: { minimum: 4 }, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :email, presence: true, uniqueness: { :case_sensitive => false }, :email_format => {:message => 'is in invalid format'}
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }, on: :update, allow_blank: true;

  def full_name
    self.first_name + " " + self.last_name
  end
end

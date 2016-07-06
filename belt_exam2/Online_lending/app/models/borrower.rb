class Borrower < ActiveRecord::Base
  has_secure_password
  has_many :histories
  has_many :lenders, through: :histories
  validates :first_name, :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :purpose, :description, presence: true, length: { minimum: 5 }
  validates :money, :raised, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :email, presence: true, uniqueness: { :case_sensitive => false }, :email_format => {:message => 'is in invalid format'}
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }, on: :update, allow_blank: true;

  def full_name
    self.first_name + " " + self.last_name
  end
end

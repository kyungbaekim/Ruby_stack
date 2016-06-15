class Dojo < ActiveRecord::Base
  has_many :ninjas, dependent: :destroy
  validates :name, :city, :state, presence: true
  validates_length_of :state, is: 2, message: "Length of state to be two characters long!!!"
end

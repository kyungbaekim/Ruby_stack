class Team < ActiveRecord::Base
  has_many :players
  validates :name, uniqueness: true, presence: true
end

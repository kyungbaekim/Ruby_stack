class Blog < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :owners, dependent: :destroy
  has_many :users, through: :owners
  has_many :messages, through: :posts
  has_many :comments, :as => :commentable
  validates :name, :description, presence: true
end

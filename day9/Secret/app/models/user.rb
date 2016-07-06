class User < ActiveRecord::Base
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :posts_liked, through: :likes, source: :post
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { :case_sensitive => false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, confirmation: true, on: :update, allow_blank: true;
end

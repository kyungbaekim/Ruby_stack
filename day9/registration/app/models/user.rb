class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, :last_name, :email, :password, presence: true
  validates :first_name, :last_name, :password, length: { minimum: 6 }
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
end

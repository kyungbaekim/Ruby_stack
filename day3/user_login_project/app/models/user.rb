class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, :last_name, :age, :email_address, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :age, numericality: { greater_than: 9, less_than: 150 }
  validates :email_address, format: { with: EMAIL_REGEX }
  before_save do
    self.email_address.downcase!
  end

  User.create(first_name: "a").valid?
  User.create(last_name: "a").valid?
  User.create(email_address: "test").valid?
  User.create(age: 5).valid?
  User.create(age: 150).valid?
end

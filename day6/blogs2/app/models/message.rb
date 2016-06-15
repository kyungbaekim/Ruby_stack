class Message < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :author, :message, presence: true
  validates_length_of :message, minimum: 15, message: "Message must be at least 15 characters long!!!"
end

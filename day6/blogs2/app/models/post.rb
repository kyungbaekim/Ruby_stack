class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many :messages, dependent: :destroy
  validates :title, :content, presence: true
  validates_length_of :title, minimum: 7, message: "Title must be at least 7 characters long!!!"
end

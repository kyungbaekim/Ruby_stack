class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user
  validates :content, presence: true, length: { minimum: 4 }
  validates :user_id, presence: true
end

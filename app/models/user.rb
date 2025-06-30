class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :admin, inclusion: { in: [true, false] }

  def liked?(post)
    likes.exists?(likeable: post)
  end
end
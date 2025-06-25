class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  
  # Add this line to allow comments on comments
  has_many :comments, as: :commentable
  
  validates :body, presence: true
end
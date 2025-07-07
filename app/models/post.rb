class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

  has_one_attached :feature_image
  has_one_attached :main_image

  validates :title, presence: true
  validates :body, presence: true
  validates :post_type, presence: true, inclusion: { in: %w[blog event news] }
end
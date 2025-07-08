class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

  has_one_attached :feature_image
  has_one_attached :main_image

  validates :title, :body, :post_type, :status, presence: true
  validates :post_type, inclusion: { in: %w[blog event news] }
  validates :status, inclusion: { in: %w[draft published archived] }

  scope :published, -> { where(status: "published") }
  scope :featured, -> { where(featured: true) }
end
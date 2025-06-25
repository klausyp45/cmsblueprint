class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :admin, inclusion: { in: [true, false] }
end

# app/models/post.rb
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  
  validates :title, presence: true
  validates :body, presence: true
  validates :post_type, presence: true, inclusion: { in: %w[blog event news] }
end

# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates :body, presence: true
end

# app/models/like.rb
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  validates_uniqueness_of :user_id, scope: [:likeable_type, :likeable_id]
end
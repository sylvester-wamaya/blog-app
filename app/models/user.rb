class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id'

  def recent_posts
    posts.order(created_at: :DESC).limit(3)
  end
end

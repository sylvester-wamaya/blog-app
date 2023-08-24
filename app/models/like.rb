class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user, foreign_key: 'author_id'

  after_create :likes_increment
  after_destroy :likes_decrement

  def likes_increment
    post.increment!(:likesCounter)
  end
  def likes_decrement
    post.decrement!(:likesCounter)
  end
end

class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  after_create :comments_increment
  after_destroy :comments_decrement

  def comments_increment
    post.increment!(:comments_counter)
  end
  def comments_decrement
    post.decrement!(:comments_counter)
  end
end

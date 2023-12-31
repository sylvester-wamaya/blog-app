class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :posts_increment
  after_destroy :posts_decrement

  def posts_increment
    user.increment!(:posts_counter)
  end

  def posts_decrement
    user.decrement!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :DESC).limit(5)
  end
end

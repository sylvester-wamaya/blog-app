class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: current_user.id, post_id: @post.id)

    flash.now[:success] = if @like.save
                            'liked'
                          else
                            'Failed to like'
                          end

    redirect_to user_post_path(@post.user, @post)
  end
end

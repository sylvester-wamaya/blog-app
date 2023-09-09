class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@post.user, @post), notice: 'Comment added successfully'
    else
      redirect_to user_post_path(@post.user, @post), alert: 'Failed to save comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

class CommentsController < ApplicationController
  load_and_authorize_resource
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

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(id: @post.id), notice: 'Comment was successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

class LikesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @like = @post.likes.new(author_id:current_user.id, post_id: @post.id)
  
      if @like.save
        flash.now[:success] = 'liked'
      else
        flash.now[:success] = 'Failed to like'
      end
  
      redirect_to user_post_path(@post.user, @post)
    end
  end
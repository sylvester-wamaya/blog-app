class LikesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      existing_like = @post.likes.find_by(user: current_user)
  
      if existing_like
        existing_like.destroy
        @post.decrement!(:likes_counter)
        flash.now[:success] = 'Unliked'
      else
        current_user.likes.create(post: @post)
        flash.now[:success] = 'Liked'
      end
  
      redirect_to user_post_path(@post.author, @post)
    end
  end
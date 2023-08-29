class PostsController < ApplicationController
   
  def index
    @user = User.includes(posts: { comments: :user }).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @posts = Post.find(parmas[:id])
  end

  end


 

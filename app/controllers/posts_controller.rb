class PostsController < ApplicationController
  def index
    @user = User.includes(posts: { comments: :user }).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.new(post_params)

    if @post.save
      flash.now[:success] = "Post has been saved successfully 👏"
      redirect_to user_posts_url(@user)
      
    else
      flash.now[:error] = "Post save failed❗"
      render new   
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

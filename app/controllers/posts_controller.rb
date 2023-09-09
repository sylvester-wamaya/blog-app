class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = current_user
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
 
    if @post.save
      flash.now[:success] = 'Post has been saved successfully 👏'
      redirect_to user_posts_url(current_user)

    else
      flash.now[:error] = 'Post save failed❗'
      render new
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order("votes_count DESC").page(params[:page]).per_page(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      current_user.posts << @post
      flash[:notice] = "Your post has been submitted."
      redirect_to root_url
    else
      flash[:alert] = "Something went wrong. Please try to save your post again."
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update post_params
      flash[:notice] = "Your post has been changed."
      redirect_to post_path @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "Your post has been removed."
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :url, :question)
  end
end

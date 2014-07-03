class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @comments = Comment.find(:all, :include => :votes, :order => "votes_count DESC")
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params
    if @comment.save
      current_user.comments << @comment
      flash[:notice] = "Your comment has been submitted."
      redirect_to root_url
    else
      flash[:alert] = "Something went wrong. Please try to save your comment again."
      render 'new'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update comment_params
      flash[:notice] = "Your comment has been changed."
      redirect_to comment_path @comment
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:alert] = "Your comment has been removed."
    redirect_to comments_path
  end

private
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end

class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    if @comment.save
      @post.comments << @comment
      current_user.comments << @comment
      flash.now[:notice] = "Your comment has been submitted."
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Something went wrong. Please try to save your comment again."
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash.now[:alert] = "Your comment has been removed."
    redirect_to comments_path
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end

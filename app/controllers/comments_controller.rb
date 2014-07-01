class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :new]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @parent_comment = Comment.find(params[:comment_id])
    @new_comment = Comment.new
  end

  def create
    @new_comment = Comment.new(comment_params)
    if @new_comment.save
      current_user.comments << @new_comment

      if params[:post_id]
        @parent_post = Post.find(params[:post_id])
        @parent_post.comments << @new_comment
      elsif params[:comment_id]
        @parent_comment = Comment.find(params[:comment_id])
        @parent_comment.comments << @new_comment
      end
      flash.now[:notice] = "Your comment has been submitted."
      if @parent_post
        redirect_to post_path(@parent_post)
      else
        redirect_to post_path(@parent_comment.commentable)
      end
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

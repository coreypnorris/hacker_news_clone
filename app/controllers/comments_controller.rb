class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :new]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new(:parent_id => params[:parent_id])
  end

  def create
    @parent = Post.find(params[:post_id]) if params[:post_id]
    @parent = Comment.find(params[:comment][:parent_id]) if params[:comment][:parent_id]
    @comment = @parent.comments.new(comment_params)
    if @comment.save
      current_user.comments << @comment
      flash[:notice] = "Your comment has been submitted."
      if params[:post_id]
        redirect_to post_path(@parent)
      else
        redirect_to post_path(@parent.commentable)
      end
    else
      flash[:error] = "Something went wrong. Please try to save your comment again."
      redirect_to :back
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
    params.require(:comment).permit(:content)
  end
end

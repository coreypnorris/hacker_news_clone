class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]

  def index
    if params[:search]
      @comments = Comment.search(params[:search]).page(params[:page]).per_page(10)
    else
      @user = User.find_by_username(params[:user_id])
      @comments = @user.comments.order("votes_count DESC").page(params[:page]).per_page(10)
    end
  end

  def new
    @comment = Comment.new(:parent_id => params[:parent_id])
  end

  def create
    @parent = Post.find(params[:post_id]) if params[:post_id]
    @parent = Comment.find(params[:comment][:parent_id]) if params[:comment][:parent_id]
    @post = @parent.class == Post ? @parent : @parent.commentable
    @comment = Comment.build_from( @post, current_user.id, comment_params[:body] )
    if @comment.save
      current_user.comments << @comment
      flash[:notice] = "Your comment has been submitted."
      if params[:post_id]
        redirect_to post_path(@parent)
      elsif params[:comment][:parent_id]
        @comment.move_to_child_of(@parent)
        redirect_to post_path(@parent.commentable)
      end
    else
      flash[:error] = "Something went wrong. Please try to save your comment again."
      redirect_to :back
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

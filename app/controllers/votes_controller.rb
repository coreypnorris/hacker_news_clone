class VotesController < ApplicationController
  def new
    @vote = Post.find(params[:post_id]).votes.new if params[:post_id]
    @vote = Comment.find(params[:comment_id]).votes.new if params[:comment_id]
    if @vote.save
      @vote.user = current_user
      flash[:notice] = "Your vote has been submitted."
      redirect_to :back
    else
      flash[:alert] = "Something went wrong. Please try to save your post again."
      redirect_to :back
    end
  end
end

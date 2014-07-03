class VotesController < ApplicationController
  def new
    @vote = Vote.new
    @parent = Post.find(params[:post_id]) if params[:post_id]
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]
    @parent.votes << @vote
    current_user.votes << @vote
    redirect_to :back
  end
end

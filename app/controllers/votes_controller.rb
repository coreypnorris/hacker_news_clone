class VotesController < ApplicationController
  def new
    @vote = Vote.new
    @post = Post.find(params[:post_id])
    @post.votes << @vote
    current_user.votes << @vote
    redirect_to root_url
  end
end

class VotesController < ApplicationController

  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
    @post = Post.find(params[:post_id])
    @post.votes << @vote
    current_user.votes << @vote
    redirect_to root_url
  end

  def create
    asd;lkfja;slkdjf
    @vote = Vote.new
    @post =
    if @vote.save
      current_user.votes << @vote

      flash.now[:notice] = "Your vote has been submitted."
      redirect_to root_url
    else
      flash.now[:alert] = "Something went wrong. Please try to save your vote again."
      render 'new'
    end
  end
end

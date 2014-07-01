class Comment < ActiveRecord::Base
  validates :content, :presence => true
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  has_many :votes
end

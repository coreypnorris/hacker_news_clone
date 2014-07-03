class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, :counter_cache => true
  belongs_to :comment
  belongs_to :voteable, polymorphic: true

  before_save :update_counters
  private
    def update_counters
      new_post = Post.find self.post_id
      Post.increment_counter(:votes_count, new_post)
      if self.post_id_was.present?
        old_post = Post.find self.post_id_was
        Post.decrement_counter(:votes_count, old_post)
      end
    end
end

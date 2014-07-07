class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, :counter_cache => true
  belongs_to :comment, :counter_cache => true
  belongs_to :voteable, polymorphic: true, :counter_cache => true

  before_save :update_post_counters
  before_save :update_comment_counters
  before_save :rerank
  before_save :increase_user_score

  private
    def update_post_counters
      if voteable_type == "Post"
        new_post = Post.find self.voteable_id
        Post.increment_counter(:votes_count, new_post)
        if self.voteable_id_was.present?
          old_post = Post.find self.voteable_id_was
          Post.decrement_counter(:votes_count, old_post)
        end
      end
    end

    def update_comment_counters
      if voteable_type == "Comment"
        new_comment = Comment.find self.voteable_id
        Comment.increment_counter(:votes_count, new_comment)
        if self.voteable_id_was.present?
          old_comment = Comment.find self.voteable_id_was
          Comment.decrement_counter(:votes_count, old_comment)
        end
      end
    end

    def rerank
      posts = Post.all.order("votes_count DESC")
      hash = Hash[posts.map.with_index.to_a]
      posts.each do |post|
        post.rank = 1
        post.rank += hash[post]
        post.save
      end
    end

    def increase_user_score
      user = voteable.user
      user.score += 1
      user.save
    end
end

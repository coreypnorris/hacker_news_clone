class Post < ActiveRecord::Base
  acts_as_commentable
  validates :title, :presence => true

  validates_presence_of :url, :unless => :question?
  validates_presence_of :question, :unless => :url?

  belongs_to :user
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable
  before_create :set_rank

  def post_type
    if question.strip.length == 0
      return "url"
    elsif url.strip.length == 0
      return "question"
    end
  end

  def hackify
    if url.include? "http://www."
      url.slice!('http://www.')
      return url.split("/").shift
    elsif url.include? "https://www."
      url.slice!('https://www.')
      return url.split("/").shift
    elsif url.include? "http://"
      url.slice!('http://')
      return url.split("/").shift
    elsif url.include? "https://"
      url.slice!('https://')
      return url.split("/").shift
    end
  end

  def upvoted_by?(current_user)
    votes.each do |vote|
      if vote.user == current_user
        return true
      end
    end
    return false
  end

  def posted_by?(current_user)
    if user == current_user
      return true
    else
      return false
    end
  end

  def score
    if votes.count == 1
      return "#{votes.count} point"
    else
      return "#{votes.count} points"
    end
  end

  def all_comments
    parent_comments = Comment.where(:commentable_id => id, :commentable_type => "Post")
    child_comments = Comment.where(:commentable_id => parent_comments.map(&:id))
    parent_comments + child_comments
  end

  def self.search(search)
    if search.empty?
      Post.none
    else
      Post.where('title LIKE ?', "%#{search}%")
    end
  end

  def set_rank
    self.rank += Post.all.length
  end

end

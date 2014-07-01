class Post < ActiveRecord::Base
  validates :title, :presence => true

  validates_presence_of :url, :unless => :question?
  validates_presence_of :question, :unless => :url?

  belongs_to :user
  has_many :votes
  has_many :comments, :as => :commentable

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
end









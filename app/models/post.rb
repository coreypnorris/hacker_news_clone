class Post < ActiveRecord::Base
  validates :title, :presence => true

  validates_presence_of :url, :unless => :question?
  validates_presence_of :question, :unless => :url?

  belongs_to :user

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

end

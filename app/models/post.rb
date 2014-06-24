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

end

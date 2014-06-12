class Post < ActiveRecord::Base
  validates :title, :presence => true

  validates_presence_of :url, :unless => :question?
  validates_presence_of :question, :unless => :url?
end

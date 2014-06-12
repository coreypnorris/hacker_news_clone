class Post < ActiveRecord::Base
  validates :title, :presence => true

  validates_presence_of :url, :unless => :text?
  validates_presence_of :text, :unless => :url?
end

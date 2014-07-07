class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_presence_of :score

  has_many :posts
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable

  def to_param
    username
  end
end

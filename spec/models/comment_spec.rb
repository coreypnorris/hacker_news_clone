require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it { should validate_presence_of :body }
  it { should belong_to :user }
  it { should have_many :votes }
  it { should have_many :comments }
end

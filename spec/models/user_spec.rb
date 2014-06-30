require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :username }
  it { should have_many :posts }
  it { should have_many :votes }
end

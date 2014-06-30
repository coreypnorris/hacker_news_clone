require 'rails_helper'

RSpec.describe Post do
  it { should validate_presence_of :title }
  it { should validate_presence_of :url or :question }
  it { should belong_to :user }
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:username => "andy", :email => "andy@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')
User.create(:username => "terry", :email => "terry@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')
User.create(:username => "joe", :email => "joe@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')
User.create(:username => "leona", :email => "leona@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')
User.create(:username => "mai", :email => "mai@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')
User.create(:username => "yuri", :email => "yuri@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')

Post.create(:title => "google", :url => "https://www.google.com/", :question => "", :user_id => 1)
Post.create(:title => "yahoo", :url => "https://www.yahoo.com/", :question => "", :user_id => 2)
Post.create(:title => "bing", :url => "http://www.bing.com/", :question => "", :user_id => 3)
Post.create(:title => "dogpile", :url => "http://www.dogpile.com/", :question => "", :user_id => 4)
Post.create(:title => "duckduckgo", :url => "https://duckduckgo.com/", :question => "", :user_id => 5)
Post.create(:title => "ixquick", :url => "https://www.ixquick.com/", :question => "", :user_id => 6)

Post.create(:title => "Help Andy", :question => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", :url => "", :user_id => 1)
Post.create(:title => "Help Terry", :question => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", :url => "", :user_id => 2)
Post.create(:title => "Help Joe", :question => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", :url => "", :user_id => 3)
Post.create(:title => "Help Leona", :question => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", :url => "", :user_id => 4)
Post.create(:title => "Help Mai", :question => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", :url => "", :user_id => 5)
Post.create(:title => "Help Yuri", :question => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", :url => "", :user_id => 6)

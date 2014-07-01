# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:username => "andy", :email => "andy@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')
User.create(:username => "terry", :email => "terry@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')
User.create(:username => "leona", :email => "leona@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')
User.create(:username => "mai", :email => "mai@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')
User.create(:username => "yuri", :email => "yuri@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')
User.create(:username => "robert", :email => "robert@example.com", :password => 'foobarbaz', :password_confirmation => 'foobarbaz')

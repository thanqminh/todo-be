# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(:email => 'thanqminh@gmail.com', :password => '12345678')
User.create(:email => 'thanqminh+1@gmail.com', :password => '12345678')
User.create(:email => 'thanqminh+2@gmail.com', :password => '12345678')
TaskList.create(:name => 'list 1 of minh1', :user_id => 1)
TaskList.create(:name => 'list 2 of minh1', :user_id => 1)
TaskList.create(:name => 'list 3 of minh1', :user_id => 1)
TaskList.create(:name => 'list 1 of minh2', :user_id => 2)
TaskList.create(:name => 'list 2 of minh2', :user_id => 2)
TaskList.create(:name => 'list 1 of minh3', :user_id => 3)
ShareTask.create(:user_id => 2, :task_list_id => 1)
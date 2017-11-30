require 'rails_helper'

RSpec.describe "TaskList API" do
  before do
    @users = []
    3.times {@users.push(create(:user))}
    @user = @users[0]
    @tasklists = []
    3.times {@tasklists.push(create(:task_list, :user => @user))}
    7.times {create(:todo, :task_list => @tasklists[0] )}
    5.times {create(:todo, :task_list => @tasklists[1] )}
    9.times {create(:todo, :task_list => @tasklists[2] )}
    @shares = [].push(
      create(:share_task, :task_list => @tasklists[0], :user => @users[1])).push(
      create(:share_task, :task_list => @tasklists[0], :user => @users[2])).push(
      create(:share_task, :task_list => @tasklists[1], :user => @users[1]))
    @serialized = ActiveModelSerializers::SerializableResource.new(@tasklists, :each_serializer => TaskListSerializer).as_json

  end

  it 'get all task lists' do
    login(@user)
    get '/task_lists', :headers => auth_headers
    expect(response.body).to look_like_json
    #put the raw object here for clarity or a serialized object
    expect(body_as_json).to match(@serialized)
    expect(response.status).to be(200)
  end

  it 'get a task list' do
    login(@user)
    get "/task_lists/#{@tasklists[0].id}", :headers => auth_headers
    json = JSON.parse(response.body)
    expect(json.has_key?('name')).to eq(true)
    expect(body_as_json).to match(@serialized[0])
    expect(response.status).to be(200)
  end
end
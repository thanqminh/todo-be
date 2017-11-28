require 'rails_helper'

RSpec.describe "TaskList API" do
  before do
    @user = create(:user)
    @tasklists = []
    2.times {@tasklists.push(create(:task_list, user: @user))}
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
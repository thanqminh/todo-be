require 'rails_helper'

RSpec.describe "Todo API" do
  before do
    @user = create(:user)
    @tasklists = []
    3.times do |i|
      @tasklists.push(create(:task_list, user: @user))
      (Random.rand(9)+1).times {create(:todo, task_list: @tasklists[i])}
    end

  end

  it 'get all todos' do
    login(@user)
    get "/task_lists/#{@tasklists[0].id}/todos", :headers => auth_headers
    json = JSON.parse(response.body)
    expect(response.status).to be(200)
  end
end
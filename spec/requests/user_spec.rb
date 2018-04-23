require "rails_helper"

RSpec.describe "User API" do

  before(:each) do
    @user = create(:user)
  end

  it 'create user and login' do
    user = build(:user)
    post '/auth', :params => {:email => user.email, :password => user.password}
    expect(response.status).to eq(200)
    login(user)
  end

  it 'update profile' do
    login(@user)
    name = Faker::Name.name
    patch '/auth', :headers => auth_headers, :params => {:user => {:name => name}}
    expect(response.status).to eq(200)
    user = User.find(@user.id)
    expect(user.name).to eq(name)
  end

  it 'get user profile' do
    login(@user)
    get '/profile', :headers => auth_headers
    expect(response.status).to eq(200)
    data = JSON.parse response.body
    expect(data["name"]).to eq(@user.name)
  end
end
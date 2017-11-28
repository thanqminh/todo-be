module ApiHelper
  def login(user)
    post '/auth/sign_in', :params => {:email => user.email, :password => user.password}
    expect(response.status).to eq(200)
    expect(response.header.has_key?('client')).to eq(true)
    expect(response.header.has_key?('uid')).to eq(true)
    expect(response.header.has_key?('access-token')).to eq(true)
    json = JSON.parse(response.body)
    expect(json.has_key?('data')).to eq(true)
    expect(json['data'].has_key?('email')).to eq(true)
    expect(json['data']['email']).to eq(user.email)

    @client = response.header['client']
    @uid = response.header['uid']
    @access_token = response.header['access-token']
  end

  def auth_headers
    {
        'access-token' => @access_token,
        'client' => @client,
        'uid' => @uid
    }
  end

  def body_as_json
    convert_hash_to_indifferent_access(JSON.parse(response.body))
  end

  def convert_hash_to_indifferent_access(obj)
    if obj.is_a?Array
      obj.map{|h|convert_hash_to_indifferent_access(h)}
    elsif obj.is_a?Hash
      obj.with_indifferent_access
    else
      obj
    end
  end
end
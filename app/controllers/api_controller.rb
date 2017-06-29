class ApiController < ActionController::Base
  before_action :set_default_response_format

  include DeviseTokenAuth::Concerns::SetUserByToken


  protected

  def set_default_response_format
    request.format = :json
  end
end

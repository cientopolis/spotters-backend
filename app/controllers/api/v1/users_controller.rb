class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :ensure_json_request

  def register
    data = JWT.decode users_params, nil, false
    @user = User.new
    @user.sub = data.first["sub"]
    @user.save
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def users_params
      params.require(:token)
    end
end

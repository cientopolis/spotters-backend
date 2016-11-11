class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :ensure_json_request
  before_action :authenticate, only: [:tutorial_complete, :tutorial]

  def sync
    data = JWT.decode params[:token], nil, false
    @user = User.find_by sub: data.first["sub"]
    if @user.nil?
      # We create the new user
      @user = User.new
      @user.sub = data.first["sub"]
      @user.name = params[:user][:name]
      @user.email = params[:user][:email]
      @user.save
    elsif @user.name != params[:user][:name] or @user.email != params[:user][:email]
      # We refresh the user data
      @user.name = params[:user][:name]
      @user.email = params[:user][:email]
      @user.save
    end
  end

  def tutorial_complete
    render json: {tutorial_complete: current_user.tutorial}
  end

  def tutorial
    current_user.tutorial = true
    current_user.save
    render json: {tutorial_complete: current_user.tutorial}
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def users_params
      params.require(:token, :user).permit(:name, :email)
    end
end

class Api::V1::MetagameController < ApplicationController
  before_action :ensure_json_request
  before_action :authenticate

  # GET /badges.json
  def badges
    render json: Metagame::Metagame.get_badges(current_user)
  end
end

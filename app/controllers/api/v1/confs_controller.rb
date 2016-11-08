class Api::V1::ConfsController < ApplicationController
  before_action :set_conf, only: [:show]
  before_action :ensure_json_request

  # GET /confs.json
  def index
    @confs = Conf.all
  end

  # GET /confs/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conf
      @conf = Conf.find(params[:id])
    end
end

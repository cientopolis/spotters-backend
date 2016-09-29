class Api::V1::ConfsController < ApplicationController
  before_action :set_conf, only: [:show, :edit, :update, :destroy]
  before_action :ensure_json_request

  # GET /confs.json
  def index
    @confs = Conf.all
  end

  # GET /confs/1.json
  def show
  end

  # POST /confs.json
  def create
    @conf = Conf.new(conf_params)

    if @conf.save
      render :show, status: :created, location: @conf
    else
      render json: @conf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /confs/1.json
  def update
    if @conf.update(conf_params)
      render :show, status: :ok, location: @conf
    else
      render json: @conf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /confs/1.json
  def destroy
    @conf.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conf
      @conf = Conf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conf_params
      params.require(:conf).permit(:title, :zoom, :center, :heading_center, :pitch_center, :bounds, :proximity_distance)
    end
end

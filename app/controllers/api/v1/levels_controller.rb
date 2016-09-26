class Api::V1::LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]
  before_action :ensure_json_request

  # GET /levels.json
  def index
    @levels = Level.all
  end

  # GET /levels/1.json
  def show
  end

  # POST /levels.json
  def create
    @level = Level.new(level_params)

    if @level.save
      render :show, status: :created, location: @level
    else
      render json: @level.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /levels/1.json
  def update
    if @level.update(level_params)
      render :show, status: :ok, location: @level
    else
      render json: @level.errors, status: :unprocessable_entity
    end
  end

  # DELETE /levels/1.json
  def destroy
    @level.destroy
    format.json { head :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      params.require(:level).permit(:name, :required_points)
    end
end

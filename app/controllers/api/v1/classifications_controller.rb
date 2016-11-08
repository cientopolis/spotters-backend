class Api::V1::ClassificationsController < ApplicationController
  before_action :set_candidate
  before_action :set_classification, only: [:show, :update, :destroy]
  before_action :ensure_json_request
  before_action :authenticate, only: [:create, :update, :destroy]

  # GET /classifications.json
  def index
    @classifications = Classification.where(:candidate_id => @candidate.id)
  end

  # GET /classifications/1.json
  def show
  end

  # POST /classifications.json
  def create
    @classification = Classification.new(classification_params)

    if @classification.save
      render :show, status: :created, location: @classification
    else
      render json: @classification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classifications/1.json
  def update
    if @classification.update(classification_params)
      render :show, status: :ok, location: @classification
    else
      render json: @classification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classifications/1.json
  def destroy
    @classification.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classification
      @classification = Classification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classification_params
      params.require(:classification).permit(:candidate_id, :data)
    end
end

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
    @classification = Classification.new({
      :candidate => Candidate.find(params[:candidate_id]),
      :data => classification_params[:classification][:data],
      :user => current_user
    })

    if @classification.save
      render :show, status: :created, location: api_v1_candidate_classification_url(@candidate, @classification)
    else
      render json: @classification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classifications/1.json
  def update
    if !classification_params[:status].blank?
      @classification.status = Classification.statuses[classification_params[:status]]
      @classification.expert = current_user
      @candidate.status = Candidate.statuses[:locked]
      @candidate.expert = current_user
    end

    if @classification.save and @candidate.save
      render :show, status: :ok, location: api_v1_candidate_classification_url(@candidate, @classification)
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
      params.permit!
    end
end

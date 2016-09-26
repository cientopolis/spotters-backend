class Api::V1::CandidatesController < ApplicationController
  helper CandidatesHelper
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  before_action :ensure_json_request

  # GET /candidates.json
  def index
    if !params[:lat].nil? and !params[:lng].nil?
      @candidates = Candidate.where("ST_DWithin(ST_GeomFromEWKB(location), ST_GeomFromText('POINT(#{params[:lng]} #{params[:lat]})'), 300, false)")
    else
      @candidates = Candidate.all
    end
  end

  # GET /candidates/1.json
  def show
  end

  # POST /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    # Se construye un punto
    factory = @candidate.location.factory
    @candidate.location = factory.point(params[:lng], params[:lat])

    # Se adjunta la imagen
    @candidate.picture = download_picture(params[:lng], params[:lat])

    if @candidate.save
      render :show, status: :created, location: @candidate
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /candidates/1.json
  def update
    if @candidate.update(candidate_params)
      render :show, status: :ok, location: @candidate
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /candidates/1.json
  def destroy
    @candidate.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit(:status, :heading, :pitch, :owner_id, :expert_id, :lat, :lng)
    end
end

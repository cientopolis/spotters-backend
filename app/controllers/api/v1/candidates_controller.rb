require 'net/http'
require 'tempfile'
require 'uri'

class Api::V1::CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  before_action :ensure_json_request
  before_save :store_current_status
  after_action :update_users_points, only: [:update]

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

    def download_picture(lat, lng)
      url = "https://maps.googleapis.com/maps/api/streetview?size=640x480&location=#{lat},#{lng}&heading=0&pitch=0&fov=120&key=#{Rails.configuration.google_api_key}"
      uri = URI.parse(url)
      Net::HTTP.start(uri.host, uri.port) do |http|
        resp = http.get(uri.path)
        file = Tempfile.new((0...8).map { (65 + rand(26)).chr }.join, Dir.tmpdir, 'wb+')
        file.binmode
        file.write(resp.body)
        file.flush
        file
      end
    end

    def store_current_status
      @current_status = @candidate.status_was
    end

    def update_users_points
      if @candidate.status != @current_status
        if @candidate.status == 'confirmed'

        elsif @candidate.status == 'rejected'

        end
      end
    end
end

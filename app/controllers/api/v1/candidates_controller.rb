class Api::V1::CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :update, :destroy]
  before_action :ensure_json_request
  before_action :authenticate, only: [:create, :update, :destroy]

  # GET /candidates.json
  def index
    pre = Candidate.includes(:owner, :expert, {classifications: [:user, {classification_votes: :user}]}, {messages: [:user, {message_votes: :user}]})
    if !params[:lat].blank? and !params[:lng].blank?
      pre = pre
        .where("ST_DWithin(ST_GeomFromEWKB(location), ST_GeomFromText('POINT(#{params[:lng]} #{params[:lat]})'), 300, false)")
    end

    if !params[:status].blank?
      pre = pre
        .where("status = #{Candidate.statuses[params[:status]]}")
    end

    if !params[:classification_status].blank?
      pre = pre
        .where("classifications.status = #{Classification.statuses[params[:classification_status]]}")
    end

    if !params[:sub].blank?
      pre = pre
        .joins(:owner, classifications: :user)
        .where("users.sub = '#{params[:sub]}' OR users_classifications.sub = '#{params[:sub]}'")
    end

    @candidates = pre
  end

  # GET /candidates/1.json
  def show
  end

  # POST /candidates.json
  def create
    @conf = Conf.where("ST_Contains(ST_GeomFromEWKB(bounds), ST_GeomFromText('POINT(#{candidate_params[:lng]} #{candidate_params[:lat]})'))")

    # Si la configuracion es nil quiere decir que el punto se encuentra fuera del rango
    if @conf.nil?
      render json: @candidate.errors, status: :unprocessable_entity
    end

    @candidate = Candidate.new(:heading => candidate_params[:heading], :owner => current_user, :pitch => candidate_params[:pitch])
    factory = RGeo::Geographic.spherical_factory(srid: 4326)

    # Se construye un punto
    @candidate.location = factory.point(candidate_params[:lng], candidate_params[:lat])
    @candidate.status = Candidate.statuses[candidate_params[:status]]
    if @candidate.save
      # Se envía la información al Metagame
      Metagame.send_contribution(@candidate)

      render :show, status: :created, location: api_v1_candidate_url(@candidate)
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /candidates/1.json
  def update
    @candidate.status = Candidate.statuses[candidate_params[:status]]
    @candidate.expert = current_user

    if @candidate.save
      render :show, status: :ok, location: api_v1_candidate_url(@candidate)
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
      params.require(:candidate).permit(:status, :heading, :pitch, :lng, :lat, :owner_id, :expert_id, :status, :classification_status, :sub)
    end
end

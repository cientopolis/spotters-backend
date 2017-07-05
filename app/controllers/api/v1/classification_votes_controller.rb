class Api::V1::ClassificationVotesController < ApplicationController
  before_action :set_candidate
  before_action :set_classification
  before_action :set_classification_vote, only: [:show, :update, :destroy]
  before_action :ensure_json_request
  before_action :authenticate, only: [:create, :update, :destroy]

  # GET /classification_votes.json
  def index
    @classification_votes = ClassificationVote.where(:classification_id => @classification.id)
  end

  # GET /classification_votes/1.json
  def show
  end

  # POST /classification_votes.json
  def create
    print classification_vote_params.inspect
    @classification_vote = ClassificationVote.new
    @classification_vote.user = current_user
    @classification_vote.positive = classification_vote_params[:positive]
    @classification_vote.classification = @classification

    if @classification_vote.save
      # Se envía la información al Metagame
      Metagame.send_reinforcement(@candidate)
      
      render :show, status: :created, location: api_v1_candidate_classification_classification_vote_url(@candidate, @classification, @classification_vote)
    else
      render json: @classification_vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classification_votes/1.json
  def update
    if @classification_vote.update(classification_vote_params)
      render :show, status: :ok, location: api_v1_candidate_classification_classification_vote_url(@candidate, @classification, @classification_vote)
    else
      render json: @classification_vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classification_votes/1.json
  def destroy
    @classification_vote.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classification_vote
      @classification_vote = ClassificationVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classification_vote_params
      params.require(:classification_vote).permit(:positive, :classification_id, :user_id)
    end
end

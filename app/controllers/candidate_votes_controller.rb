class CandidateVotesController < ApplicationController
  before_action :set_candidate_vote, only: [:show, :edit, :update, :destroy]

  # GET /candidate_votes
  # GET /candidate_votes.json
  def index
    @candidate_votes = CandidateVote.all
  end

  # GET /candidate_votes/1
  # GET /candidate_votes/1.json
  def show
  end

  # GET /candidate_votes/new
  def new
    @candidate_vote = CandidateVote.new
  end

  # GET /candidate_votes/1/edit
  def edit
  end

  # POST /candidate_votes
  # POST /candidate_votes.json
  def create
    @candidate_vote = CandidateVote.new(candidate_vote_params)

    respond_to do |format|
      if @candidate_vote.save
        format.html { redirect_to @candidate_vote, notice: 'Candidate vote was successfully created.' }
        format.json { render :show, status: :created, location: @candidate_vote }
      else
        format.html { render :new }
        format.json { render json: @candidate_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate_votes/1
  # PATCH/PUT /candidate_votes/1.json
  def update
    respond_to do |format|
      if @candidate_vote.update(candidate_vote_params)
        format.html { redirect_to @candidate_vote, notice: 'Candidate vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate_vote }
      else
        format.html { render :edit }
        format.json { render json: @candidate_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate_votes/1
  # DELETE /candidate_votes/1.json
  def destroy
    @candidate_vote.destroy
    respond_to do |format|
      format.html { redirect_to candidate_votes_url, notice: 'Candidate vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate_vote
      @candidate_vote = CandidateVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_vote_params
      params.require(:candidate_vote).permit(:positive, :user_id, :candidate_id)
    end
end

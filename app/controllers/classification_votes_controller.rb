class ClassificationVotesController < ApplicationController
  before_action :set_classification_vote, only: [:show, :edit, :update, :destroy]

  # GET /classification_votes
  # GET /classification_votes.json
  def index
    @classification_votes = ClassificationVote.all
  end

  # GET /classification_votes/1
  # GET /classification_votes/1.json
  def show
  end

  # GET /classification_votes/new
  def new
    @classification_vote = ClassificationVote.new
  end

  # GET /classification_votes/1/edit
  def edit
  end

  # POST /classification_votes
  # POST /classification_votes.json
  def create
    @classification_vote = ClassificationVote.new(classification_vote_params)

    respond_to do |format|
      if @classification_vote.save
        format.html { redirect_to @classification_vote, notice: 'Classification vote was successfully created.' }
        format.json { render :show, status: :created, location: @classification_vote }
      else
        format.html { render :new }
        format.json { render json: @classification_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classification_votes/1
  # PATCH/PUT /classification_votes/1.json
  def update
    respond_to do |format|
      if @classification_vote.update(classification_vote_params)
        format.html { redirect_to @classification_vote, notice: 'Classification vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @classification_vote }
      else
        format.html { render :edit }
        format.json { render json: @classification_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classification_votes/1
  # DELETE /classification_votes/1.json
  def destroy
    @classification_vote.destroy
    respond_to do |format|
      format.html { redirect_to classification_votes_url, notice: 'Classification vote was successfully destroyed.' }
      format.json { head :no_content }
    end
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

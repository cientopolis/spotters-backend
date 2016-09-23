class MessageVotesController < ApplicationController
  before_action :set_message_vote, only: [:show, :edit, :update, :destroy]

  # GET /message_votes
  # GET /message_votes.json
  def index
    @message_votes = MessageVote.all
  end

  # GET /message_votes/1
  # GET /message_votes/1.json
  def show
  end

  # GET /message_votes/new
  def new
    @message_vote = MessageVote.new
  end

  # GET /message_votes/1/edit
  def edit
  end

  # POST /message_votes
  # POST /message_votes.json
  def create
    @message_vote = MessageVote.new(message_vote_params)

    respond_to do |format|
      if @message_vote.save
        format.html { redirect_to @message_vote, notice: 'Message vote was successfully created.' }
        format.json { render :show, status: :created, location: @message_vote }
      else
        format.html { render :new }
        format.json { render json: @message_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_votes/1
  # PATCH/PUT /message_votes/1.json
  def update
    respond_to do |format|
      if @message_vote.update(message_vote_params)
        format.html { redirect_to @message_vote, notice: 'Message vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_vote }
      else
        format.html { render :edit }
        format.json { render json: @message_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_votes/1
  # DELETE /message_votes/1.json
  def destroy
    @message_vote.destroy
    respond_to do |format|
      format.html { redirect_to message_votes_url, notice: 'Message vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_vote
      @message_vote = MessageVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_vote_params
      params.require(:message_vote).permit(:positive, :user_id, :message_id)
    end
end

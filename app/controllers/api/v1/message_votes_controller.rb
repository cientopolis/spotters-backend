class Api::V1::MessageVotesController < ApplicationController
  before_action :set_message
  before_action :set_message_vote, only: [:show, :update, :destroy]
  before_action :ensure_json_request
  before_action :authenticate, only: [:create, :update, :destroy]

  # GET /message_votes.json
  def index
    @message_votes = MessageVote.where(:message_id => @message.id)
  end

  # GET /message_votes/1.json
  def show
  end

  # POST /message_votes.json
  def create
    @message_vote = MessageVote.new(message_vote_params)

    if @message_vote.save
      render :show, status: :created, location: @message_vote
    else
      format.json { render json: @message_vote.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /message_votes/1.json
  def update
    if @message_vote.update(message_vote_params)
      render :show, status: :ok, location: @message_vote
    else
      render json: @message_vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /message_votes/1.json
  def destroy
    @message_vote.destroy
    head :no_content
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

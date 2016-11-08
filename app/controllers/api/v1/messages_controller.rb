class Api::V1::MessagesController < ApplicationController
  before_action :set_candidate
  before_action :set_message, only: [:show, :update, :destroy]
  before_action :ensure_json_request
  before_action :authenticate, only: [:create, :update, :destroy]

  # GET /messages.json
  def index
    @messages = Message.where(:candidate_id => @candidate.id)
  end

  # GET /messages/1.json
  def show
  end

  # POST /messages.json
  def create
    @message = Message.new
    @message.text = message_params[:text]
    @message.candidate = @candidate
    @message.user = current_user

    if @message.save
      render :show, status: :created, location: api_v1_candidate_messages_url(@candidate, @message)
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1.json
  def update
    if @message.update(message_params)
      render :show, status: :ok, location: api_v1_candidate_messages_url(@candidate, @message)
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1.json
  def destroy
    @message.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:text, :candidate_id)
    end
end

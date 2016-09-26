class Api::V1::MessagesController < ApplicationController
  before_action :set_candidate
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :ensure_json_request

  # GET /messages.json
  def index
    @messages = Message.where(:candidate_id => @candidate.id)
  end

  # GET /messages/1.json
  def show
  end

  # POST /messages.json
  def create
    @message = Message.new(message_params)

    if @message.save
      render :show, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1.json
  def update
    if @message.update(message_params)
      render :show, status: :ok, location: @message
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
      params.require(:message).permit(:text, :user_id, :candidate_id)
    end
end

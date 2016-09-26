class Api::V1::TutorialStepsController < ApplicationController
  before_action :set_tutorial_step, only: [:show, :edit, :update, :destroy]
  before_action :ensure_json_request

  # GET /tutorial_steps.json
  def index
    @tutorial_steps = TutorialStep.all
  end

  # GET /tutorial_steps/1.json
  def show
  end

  # POST /tutorial_steps.json
  def create
    @tutorial_step = TutorialStep.new(tutorial_step_params)

    if @tutorial_step.save
      render :show, status: :created, location: @tutorial_step
    else
      render json: @tutorial_step.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tutorial_steps/1.json
  def update
      if @tutorial_step.update(tutorial_step_params)
        render :show, status: :ok, location: @tutorial_step
      else
        render json: @tutorial_step.errors, status: :unprocessable_entity
      end
  end

  # DELETE /tutorial_steps/1.json
  def destroy
    @tutorial_step.destroy
    format.json { head :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial_step
      @tutorial_step = TutorialStep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_step_params
      params.require(:tutorial_step).permit(:title, :text, :position)
    end
end

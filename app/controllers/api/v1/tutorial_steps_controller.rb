class Api::V1::TutorialStepsController < ApplicationController
  before_action :set_tutorial_step, only: [:show]
  before_action :ensure_json_request

  # GET /tutorial_steps.json
  def index
    @tutorial_steps = TutorialStep.all
  end

  # GET /tutorial_steps/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial_step
      @tutorial_step = TutorialStep.find(params[:id])
    end
end

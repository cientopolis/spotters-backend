class Api::V1::WorkflowsController < ApplicationController
  before_action :set_workflow, only: [:show]
  before_action :ensure_json_request

  # GET /workflows.json
  def index
    @workflows = Workflow.all
  end

  # GET /workflows/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow
      @workflow = Workflow.find(params[:id])
    end
end

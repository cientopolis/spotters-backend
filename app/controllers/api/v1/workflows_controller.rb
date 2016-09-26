class Api::V1::WorkflowsController < ApplicationController
  before_action :set_workflow, only: [:show, :edit, :update, :destroy]
  before_action :ensure_json_request

  # GET /workflows.json
  def index
    @workflows = Workflow.all
  end

  # GET /workflows/1.json
  def show
  end

  # POST /workflows.json
  def create
    @workflow = Workflow.new(workflow_params)

    if @workflow.save
      render :show, status: :created, location: @workflow
    else
      render json: @workflow.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workflows/1.json
  def update
    if @workflow.update(workflow_params)
      render :show, status: :ok, location: @workflow
    else
      render json: @workflow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workflows/1.json
  def destroy
    @workflow.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow
      @workflow = Workflow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workflow_params
      params.require(:workflow).permit(:name)
    end
end

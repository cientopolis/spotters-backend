class Api::V1::TasksController < ApplicationController
  before_action :set_workflow
  before_action :set_task, only: [:show]
  before_action :ensure_json_request

  # GET /tasks.json
  def index
    @tasks = Task.where(:workflow_id => @workflow.id)
  end

  # GET /tasks/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end
end

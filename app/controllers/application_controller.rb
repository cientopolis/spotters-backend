class ApplicationController < ActionController::Base
  include Knock::Authenticable
  protect_from_forgery with: :exception

  def ensure_json_request
    return if request.format == :json
    render :nothing => true, :status => 406
  end

  def set_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end

  def set_classification
    @classification = Classification.find(params[:classification_id])
  end

  def set_message
    @message = Message.find(params[:message_id])
  end

  def set_workflow
    @workflow = Workflow.find(params[:workflow_id])
  end
end

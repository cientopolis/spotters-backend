json.extract! workflow, :id, :name, :created_at, :updated_at
json.tasks workflow.tasks
json.url api_v1_workflow_url(workflow, format: :json)

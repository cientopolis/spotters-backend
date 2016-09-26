json.extract! task, :id, :multiple, :widget_type, :content, :created_at, :updated_at
json.url api_v1_workflow_task_url(@workflow, task, format: :json)

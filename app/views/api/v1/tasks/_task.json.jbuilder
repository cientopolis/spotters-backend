json.extract! task, :id, :multiple, :widget_type, :content, :next_id, :created_at, :updated_at
json.url api_v1_workflow_task_url(@workflow, task, format: :json)

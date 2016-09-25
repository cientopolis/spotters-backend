json.extract! task, :id, :multiple, :type, :content, :next_id, :created_at, :updated_at
json.url task_url(task, format: :json)
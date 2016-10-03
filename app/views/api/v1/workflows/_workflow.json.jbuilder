json.extract! workflow, :id, :name, :created_at, :updated_at
json.first_task workflow.first_task
json.tasks workflow.tasks

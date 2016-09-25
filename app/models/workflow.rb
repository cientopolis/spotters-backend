class Workflow < ApplicationRecord
  references :first_task, class_name: 'Task'
  has_many :tasks
end

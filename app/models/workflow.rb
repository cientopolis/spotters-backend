class Workflow < ApplicationRecord
  references :first_task, class_name: "Task"
  has_many :tasks

  validates :name, presence: true
end

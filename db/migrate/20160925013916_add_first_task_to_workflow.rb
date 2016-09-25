class AddFirstTaskToWorkflow < ActiveRecord::Migration[5.0]
  def change
    change_table :workflows do |t|
      t.references :first_task, index: true
    end

    add_foreign_key :workflows, :tasks, column: :first_task_id
  end
end

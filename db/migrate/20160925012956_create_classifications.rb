class CreateClassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :classifications do |t|
      t.integer :status, default: 0, null: false

      # JSON structure to store the result of each task.
      # Example:
      # [
      #   {
      #     task_id: 3,
      #     answer: \'Escultura\'
      #   },
      #   {
      #     task_id: 2,
      #     answer: [
      #       \'Mármol\',
      #       \'Cemento\'
      #     ]
      #   },
      #   {
      #     task_id: 1,
      #     answer: \'Escultura de mediados de la década del 90\'
      #   }
      # ]
      t.jsonb :data

      t.belongs_to :candidate, foreign_key: true, null: false
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :expert, index: true

      t.timestamps
    end

    add_foreign_key :classifications, :users, column: :expert_id
  end
end

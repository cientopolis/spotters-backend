class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.boolean :multiple
      t.string :widget_type
      # Stores the question and answers for the current task
      # {
      #   question: \'Qué tipo de elemento ve en el panorama?\',
      #   next_id: 2
      #   answers: [
      #     {
      #       label: \'Escultura\',
      #       next_id: #{task2.id}
      #     },
      #     {
      #       label: \'Monumento\',
      #       next_id: #{task3.id}
      #     }
      #   ]
      # }
      t.jsonb :content
      t.belongs_to :workflow, foreign_key: true, null: false

      t.timestamps
    end
  end
end

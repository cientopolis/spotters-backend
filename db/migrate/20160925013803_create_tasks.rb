class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.boolean :multiple
      t.string :widget_type
      t.jsonb :content
      t.belongs_to :workflow, foreign_key: true, null: false
      t.references :next, index: true

      t.timestamps
    end

    add_foreign_key :tasks, :tasks, column: :next_id
  end
end
